# frozen_string_literal: true

class Speaker < ApplicationRecord
  belongs_to :event, optional: true

  def address
    "#{city} #{country}"
  end
end
