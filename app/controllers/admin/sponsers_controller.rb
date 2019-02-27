class Admin::SponsersController < AdminController
  
  def index
    @sponsers = Sponser.all
  end

  def show
    @sponsers = Sponser.find(params[:id])
  end  
end
