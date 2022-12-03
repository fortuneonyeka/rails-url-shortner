class UrlsController < ApplicationController
  def index
    @url = Url.new
  end

  def create
    url = Url.new permitted_params

    if url.save
      flash[:success] = "<p>shortened URL successfully created!</p> <a  href='#{url.shortend_url}'target='_blank'>#{url.shortend_url}</a>"
    else
      flash[:error] = "<p>Invalid Url #{url.errors.full_messages.join()} that contain http or https</p>"
    end
      redirect_to root_path
  end


  private

  def permitted_params
    params.require(:url).permit(:name)
  end
  
end