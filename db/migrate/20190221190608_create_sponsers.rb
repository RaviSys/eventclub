# frozen_string_literal: true

class CreateSponsers < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsers do |t|
      t.string :sponsered_by
      t.string :logo_image
      t.integer :amount
      t.string :website
      t.string :contact
      t.text :about
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
