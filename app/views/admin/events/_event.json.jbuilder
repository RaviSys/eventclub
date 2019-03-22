# frozen_string_literal: true

json.extract! event,
              :id,
              :name,
              :description,
              :start_date,
              :end_date,
              :cover_image,
              :venue,
              :city,
              :state,
              :country,
              :latitude,
              :longitude,
              :created_at,
              :updated_at
json.url event_url(event, format: :json)
