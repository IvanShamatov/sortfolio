class WebstudiosController < ApplicationController
  def index
  	@ws=Webstudio.all
  end

  def show
  	@wd=Webstudio.find(params[:id]) 
  end

  def edit
  	@wd=Webstudio.find(params[:id]) 
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
