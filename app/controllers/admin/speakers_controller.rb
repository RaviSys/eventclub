class Admin::SpeakersController < AdminController
  
  def index
    @speakers = Speaker.all
  end

  def show
    @speakers = Speaker.find(params[:id])
  end  
end
