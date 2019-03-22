# frozen_string_literal: true

class AddFavouritesCountToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :favourites_count, :integer
  end
end