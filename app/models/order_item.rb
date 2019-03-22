# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :event_ticket, optional: true
  belongs_to :user, optional: true

  after_create :update_available_tickets
  after_destroy :update_available_tickets

  def update_available_tickets
    event_ticket = self.event_ticket
    if destroyed?
      event_ticket.available_tickets += 1

    else
      event_ticket.available_tickets -= 1
    end
    event_ticket.update(available_tickets: event_ticket.available_tickets)
  end
end
