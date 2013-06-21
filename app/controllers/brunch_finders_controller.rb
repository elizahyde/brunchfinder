class BrunchFindersController < ApplicationController
  def index
    @instagram = Instagram.tag_recent_media("brunch")
  end

  def get_address
    location = params[:location]
    response[:location] = location
  end

  def results
    @location = params[:location]
    if params[:search_type] == "Bloodies"
      # do stuff
      @j = Search.get_bloodies(@location)
    elsif params[:search_type] == "Mimosas"
      @j = Search.get_mimosas(@location)
      # do stuff
    elsif params[:search_type] == "Eggs"
      @j = Search.get_eggs(@location)
      # do stuff
    elsif params[:search_type] == "Pancakes"
      @j = Search.get_pancakes(@location)
      # do stuff
    else
      @j = Search.get_brunch(@location)
      # that other button
    end

end

  def topspots
    #top 5 spots by drinks and top 5 based on food. could be static and pulled by articles?
  end

  def coups
    #this should show a list of coups from local deals for brunch
  end
end