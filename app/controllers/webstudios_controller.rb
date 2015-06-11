class WebstudiosController < ApplicationController
  def index
    @c = City.all
  	@ws=Webstudio.all
  end

  def filter
    @c = City.all
    @ws = Array.new
    if (!params[:filter][:pricelow].empty?&&!params[:filter][:pricehigh].empty?&&!params[:filter][:city].empty?) == true
      Webstudio.all.each do |ws|
           @ws << ws if ws.average_ticket.to_f.between?(params[:filter][:pricelow].to_f,params[:filter][:pricehigh].to_f)&&ws.city_id.to_i==params[:filter][:city].to_i
      end
    elsif (!params[:filter][:pricelow].empty?&&!params[:filter][:pricehigh].empty?) == true
      Webstudio.all.each do |ws|
           @ws << ws if ws.average_ticket.to_f.between?(params[:filter][:pricelow].to_f,params[:filter][:pricehigh].to_f)
      end
    elsif (!params[:filter][:city].empty?) == true
      Webstudio.all.each do |ws|
           @ws << ws if ws.city_id.to_i==params[:filter][:city].to_i
      end
    else 
      Webstudio.all.each do |ws|
          @ws << ws
      end
    end
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
