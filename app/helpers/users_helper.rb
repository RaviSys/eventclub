# frozen_string_literal: true

module UsersHelper
  def event
    @ticket.keys.first
  end

  def tickets
    @ticket.values.flatten
  end
end
