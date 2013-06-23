class BrunchFindersController < ApplicationController
  def index
    @instagram = Instagram.tag_recent_media("brunch")
  end

  # def get_address
  #   location = params[:location]
  #   response[:location] = location

  # end

  def results
    @location = params[:location]
    @latlng = [ params[:lat], params[:lng] ].join(",")

    @f = Search.get_foursquare(@latlng)
    if params[:search_type] == "Bloodies"
      @j = Search.get_bloodies(@location)
    elsif params[:search_type] == "Mimosas"
      @j = Search.get_mimosas(@location)
    elsif params[:search_type] == "Eggs"
      @j = Search.get_eggs(@location)
    elsif params[:search_type] == "Pancakes"
      @j = Search.get_pancakes(@location)
    else
      @f = Search.get_foursquare(@latlng)
      @j = Search.get_brunch(@location)
    end

end

  def topspots
    #top 5 spots by drinks and top 5 based on food. could be static and pulled by articles?

  end

  def coups
    #this should show a list of coups from local deals for brunch
  end
end