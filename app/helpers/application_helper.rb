# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    case level
    when :success then 'alert alert-success'
    when :notice then 'alert alert-success'
    when :alert then 'alert alert-danger'
    when :error then 'alert alert-error'
    when :warning then 'alert alert-warning'
    end
  end

  def current_user_tickets
    current_user.order_items.map(&:event_ticket).map(&:event).uniq
  end

  def current_user_favourites
    current_user.favourites if user_signed_in?
  end
end
