class HomeController < ApplicationController
  def index
    @upcoming_events = Event.upcoming_events.limit(3)
  end

  def search_events
    lat = params[:search][:latitude]
    long = params[:search][:longitude]
    @events = Event.near([lat, long], 50, units: :km)
  end

  def tagged_events
    @events = Event.tagged_with(params[:tag])
  end

end
