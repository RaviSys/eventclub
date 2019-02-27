class HomeController < ApplicationController
  def index
    @upcoming_events = Event.upcoming_events
  end

  def search_events
  end

end
