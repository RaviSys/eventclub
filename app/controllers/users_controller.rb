# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_event, only: :myticket
  include ApplicationHelper

  def show
    @profile_events = current_user_tickets
    @favourite_events = current_user_favourites
  end

  def myticket
    @ticket = {}
    @ticket[@event] = current_user.order_items.joins(:event_ticket).where('event_tickets.event_id = ?', @event.id)
  end

  private

  def find_event
    @event = Event.find_by(id: params[:event_id])
  end
end
