# frozen_string_literal: true

class EventTicket < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :event, optional: true
  validates :price, :total_tickets, presence: true, numericality: true

  delegate :name, to: :event
  delegate :venue, to: :event
  delegate :start_date, to: :event

  before_create :set_available_tickets

  def set_available_tickets
    self.available_tickets = total_tickets
  end
end
