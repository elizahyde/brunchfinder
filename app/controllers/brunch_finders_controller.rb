class BrunchFindersController < ApplicationController
  def index
    @instagram = Instagram.tag_recent_media("brunch")
  end

  def results
    @latlng = [ params[:lat], params[:lng] ].join(",")

    # @f = Search.get_foursquare(@latlng)
    if params[:search_type] == "Bloodies"
      @f = Search.get_bloodies(@latlng)
    elsif params[:search_type] == "Mimosas"
      @f = Search.get_mimosas(@latlng)
    elsif params[:search_type] == "Eggs"
      @f = Search.get_eggs(@latlng)
    elsif params[:search_type] == "Pancakes"
      @f = Search.get_pancakes(@latlng)
    else
      @f = Search.get_brunch(@latlng)
    end
  end

end