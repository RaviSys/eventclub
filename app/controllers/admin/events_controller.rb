# frozen_string_literal: true

class Admin::EventsController < AdminController
  before_action :set_resource, only: %w[show edit update destroy]
  include Concerns::AdminCrud

  def calender
    @events = []
    Event.all.each do |event|
      @events << { title: event.name,
                   start: event.start_date,
                   end: event.end_date,
                   slug: event.slug }
    end
    gon.events = @events
  end

  private

  def event_params
    params.require(:event).permit!
  end

  def set_resource(resource = nil)
    resource ||= Event.friendly.find(params[:id])
    @event = resource
  end
end
