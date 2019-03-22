# frozen_string_literal: true

class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :order_item_params, only: :create
  before_action :find_order_item, only: [:destroy]

  def create
    quantity = JSON.parse(order_item_params[:quantity])
    amount = JSON.parse(order_item_params[:amount])
    tickets = EventTicket.where(id: quantity.keys)
    @order_items = []
    tickets.each do |ticket|
      next unless ticket.available_tickets.positive?

      next if quantity[ticket.id.to_s].to_i.zero?

      @order_items << ticket.order_items.create(
        amount: amount[ticket.id.to_s].to_i * quantity[ticket.id.to_s].to_i,
        quantity: quantity[ticket.id.to_s].to_i
      )
    end
    set_current_order(@order_items)
    render :payment
  end

  def show
    @order_items = OrderItem.where(id: params[:id].split('/'))
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: current_user.name.to_s,
               template: 'order_items/show.pdf.erb',
               temp_path: '/tmp',
               page_size: 'A4', disposition: 'attachment'
      end
    end
  end

  def delete_order
    path = if session[:current_order].present?
             update_order_items(session[:current_order].collect { |x| x['id'] })
             set_current_order
             root_path
           else
            update_order_items(params[:ids])
            user_path(current_user.id)
           end
    redirect_to path
  end

  def payment
    obj = StripeService.new(params[:total_amount].to_i,
                            current_user.email,
                            params[:stripeToken])
    current_user.stripe_customer_id ||= obj.customer[:id]
    payment = obj.charge(current_user.stripe_customer_id) if current_user.save

    render :error_page unless payment[:status].eql?('succeeded')

    update_order_items(session[:current_order].collect { |x| x['id'] })
    set_current_order
    render :thankyou
  end


  protected

  def order_item_params
    params.permit(%i[amount quantity])
  end

  def find_order_item
    @order_item = OrderItem.find_by(id: params[:id])
  end

  def set_current_order(data = nil)
    session[:current_order] = data
  end

  def update_order_items(ids)
    @order_items = OrderItem.where(id: ids)
    if action_name.eql?('delete_order')
      @order_items.send(:destroy_all)
    else
      @order_items.send(:update, user_id: current_user.id)
    end
  end
end
