class UrlsController < ApplicationController
  def index
   
  end

  def create
    @url = Url.new 
  end
end