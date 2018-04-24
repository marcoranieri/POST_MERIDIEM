class PlacesController < ApplicationController

  def index
   if Place.open_now(3,24)
    @places = Place.all
  else
    redirect_to_index
  end
end


def show
  @place = Place.find(params[:id])
end
end
