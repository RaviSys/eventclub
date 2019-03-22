# frozen_string_literal: true

module EventsHelper
  def registered?(event)
    order_items = current_user.order_items
    order_items.map(&:event_ticket).map(&:event).include?(event) || false
  end

  def find_favourite(event)
    current_user_favourites.find_by(event_id: event.id).present?
  end
end
