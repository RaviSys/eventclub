class AddTicketForToEventTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :event_tickets, :ticket_for, :string
  end
end
