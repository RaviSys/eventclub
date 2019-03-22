# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :amount
      t.integer :quantity
      t.references :user
      t.references :event_ticket, foreign_key: true
      t.timestamps
    end
  end
end
