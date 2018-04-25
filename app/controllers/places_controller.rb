class PlacesController < ApplicationController

  def index
    # this is just to work on the index,
    # replace it with your code :)
    # by Cali 25/04
    @places = Place.all
end

def show
  @place = Place.find(params[:id])
end
end
