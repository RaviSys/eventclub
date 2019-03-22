# frozen_string_literal: true

class CreateEventTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :event_tickets do |t|
      t.integer :price
      t.integer :total_tickets
      t.integer :available_tickets
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
