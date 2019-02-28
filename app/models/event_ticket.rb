class EventTicket < ApplicationRecord
  belongs_to :event, optional: true
  validates :price, :total_tickets, presence: true, numericality: true

  before_create :set_available_tickets

  def set_available_tickets
    self.available_tickets = self.total_tickets
  end

end
