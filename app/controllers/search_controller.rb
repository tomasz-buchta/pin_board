class SearchController < ApplicationController

  respond_to :html

  def index
    if params[:q]
      @pins = Pin.search params[:q]
    else
      @pins = []
    end
    
  end

end
