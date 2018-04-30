class PlacesController < ApplicationController

  def index
    @places = []
    Place.all.each do |place|
      if place.matches.blank?
        @places << place
      else
        place.matches.each do |matchh|
          @places << place if matchh.user != current_user
        end
      end
    end
  end


  def show
    @place = Place.find(params[:id])
  end

  def show_image
    photo_reference = @place.google_data["photos"][0]["photo_reference"]
  end

end

