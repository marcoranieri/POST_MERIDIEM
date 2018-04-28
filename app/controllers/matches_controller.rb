class MatchesController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!


  def create
   if params.has_key?("username")
     userid = params["username"].to_i
     placeid = params["place_id"].to_i
     @match = Match.new(user_id: userid, place_id: placeid)
     @match.save!
   else
    @place = Place.find(params[:place_id])
    @match = Match.new(matches_params)
    @match.user = current_user
    @match.place = @place
    user_id = current_user.id
    @match.save
  end
    # # if @match.save
    #   redirect_to "/users/#{user_id}/matches"
    # else
    #   redirect_to "/places"
    # end
  end

  def user_matches
    @user_matches = Match.where(user_id: current_user)
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



