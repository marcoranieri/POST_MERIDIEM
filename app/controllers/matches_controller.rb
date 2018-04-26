class MatchesController < ApplicationController

  def create
    @place = Place.find(params[:place_id])
    @match = Match.new(matches_params)
    @match.user = current_user
    @match.place = @place
    user_id = current_user.id

    @match.save
    # if @match.save
    #   redirect_to "/users/#{user_id}/matches"
    # else
    #   redirect_to "/places"
    # end
  end

  def user_matches
    @user_matches = Match.where(user_id: current_user)

    photo_reference =  @user_matches[0].place.google_data["photos"][0]["photo_reference"]
    @url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8"
  end

  def update
  end

  def destroy
    user_id = current_user.id
    # arbi = Match.where(user_id: current_user, place_id: params[:place_id]).first
    arbi = Match.find(params[:id])
    arbi.destroy
    redirect_to "/users/#{user_id}/matches"
    # render :user_matches
    # respond_to do |format|
    #   format.html { redirect_to "users/#{user_id}/matches", notice: 'Match was successfully destroyed.' }
    # end
  end

  def index

  end

  def show
  end

  private

  def matches_params
    params.require(:place).permit(:place_id)
  end

end



