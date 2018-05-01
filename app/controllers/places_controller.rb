class PlacesController < ApplicationController

  def index
    @places = []
    already_matches_place_ids = current_user.matches.where(status: "yes").map(&:place_id)

    Place.where.not(id: already_matches_place_ids).each do |place|
      next if params[:kind].present? and not place.google_data["types"].include? params[:kind]

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

