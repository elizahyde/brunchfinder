class BrunchFindersController < ApplicationController
  def index
  end

  def results
    @latlng = [ params[:lat], params[:lng] ].join(",")

      @f = Search.get_brunch(@latlng)
  end

end