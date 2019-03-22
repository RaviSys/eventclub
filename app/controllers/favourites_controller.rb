# frozen_string_literal: true

class FavouritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    favourite = find_favourite(params[:event])
    @favourite_status = if favourite.present?
                          favourite.destroy
                          false
                        else
                          current_user_favourites.create(event_id: params[:event])
                          true
                        end
  end
end
