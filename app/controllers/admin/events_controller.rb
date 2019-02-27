class Admin::EventsController < AdminController
  include Concerns::AdminCrud

  private

    def event_params
      params.require(:event).permit!
    end
end
