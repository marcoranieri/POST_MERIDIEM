class PlacesController < ApplicationController

  def index
    @places = []
    already_matches_place_ids = current_user.matches.where(status: "yes").map(&:place_id)

    Place.where.not(id: already_matches_place_ids).each do |place|
      next if params[:kind].present? and not place.google_data["types"].include? params[:kind]
      next if not place.google_data["opening_hours"]
      next if not place.google_data["opening_hours"]["open_now"]
      next if not place.google_data["photos"][0]

      @places << place
    end
    @places = @places.shuffle.first(10)
  end


  def show
    @place = Place.find(params[:id])
  end

  def show_image
    photo_reference = @place.google_data["photos"][0]["photo_reference"]
  end

end

