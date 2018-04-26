class PlacesController < ApplicationController

  def index
    @places = Place.all
  end


  def show
    @place = Place.find(params[:id])

    photo_reference = @place.google_data["photos"][0]["photo_reference"]
    @url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8"

  end
end
