class BrunchFindersController < ApplicationController
  def index
    @instagram = Instagram.tag_recent_media("brunch")
  end

  def results
    @latlng = [ params[:lat], params[:lng] ].join(",")

    if params[:search_type] == "Bloodies"
      @f = Search.get_bloodies(@latlng)
    elsif params[:search_type] == "Mimosas"
      @f = Search.get_mimosas(@latlng)
    else
      @f = Search.get_brunch(@latlng)
    end
  end

end