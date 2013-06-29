class ErrorsController < ApplicationController
  def show
    render :text => 'Oh no! Something happened!  Try again'
  end
end