class PlacesController < ApplicationController

  def index
    @places = Place.all
  end


  def show
    @place = Place.find(params[:id])
  end

  def show_image
    photo_reference = @place.google_data["photos"][0]["photo_reference"]
  end

end

