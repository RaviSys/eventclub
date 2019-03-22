# frozen_string_literal: true

class Favourite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event, optional: true, counter_cache: true

  delegate :name, to: :event
  delegate :start_date, to: :event
  delegate :end_date, to: :event
  delegate :short_address, to: :event
end
