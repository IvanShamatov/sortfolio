class WebstudiosController < ApplicationController
  def index
  	@ws=Webstudio.all
  end

  def filter
    @ws = Array.new
    Webstudio.all.each do |ws|
      if ws.average_ticket.between?(params[:filter][:pricelow].to_f,params[:filter][:pricehigh].to_f)
        @ws << ws
      end
    end
    # params[:filter][:pricelow]
    # params[:filter][:pricehigh]
    # @ws=Webstudio.where(average_ticket: ()
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


  # def filter_params
  #   params.require(:filter).permit(:pricelow, :pricehigh)
  # end
end
