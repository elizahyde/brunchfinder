class BrunchFindersController < ApplicationController
  def index
  end

  def get_address
    location = params[:location]
    response = {}
    response[:location] = location
  end

  # def search
  # end

  def results
    @location = params[:location]

    if params[:query] != nil
      location = params[:query]
      @s = Search.brunch_finders_details(location)
    else
      @s = Search.brunch_finders_details(@location_)
    end
end

  def topspots
    #top 5 spots by drinks and top 5 based on food. could be static and pulled by articles?
  end

  def coups
    #this should show a list of coups from local deals for brunch
  end
end