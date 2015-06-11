class WebstudiosController < ApplicationController
  def index
    @c = City.all
  	@ws=Webstudio.all
  end

  def filter
    @c = City.all
    @ws = Webstudio.all
    @ws = @ws.where(city_id: params[:filter][:city_id]) unless params[:filter][:city_id].empty?
    @ws = @ws.where("average_ticket < ?", params[:filter][:pricehigh]) unless params[:filter][:pricehigh].empty? 
    @ws = @ws.where("average_ticket > ?", params[:filter][:pricelow]) unless params[:filter][:pricelow].empty?
  end

  def show
  	@wd=Webstudio.find(params[:id]) 
  end

  def edit
  	@wd=Webstudio.find(params[:id]) 
    unless @wd.user == current_user
      redirect_to :action => "index"
    end
  end

  def update
  	@wd=Webstudio.find(params[:id])
  	@wd.update_attributes(webstudio_params)
  	redirect_to :action => "show"
  end

  private

  def webstudio_params
  	params.require(:webstudio).permit(:name, :average_ticket, :description, :img)
  end
end
