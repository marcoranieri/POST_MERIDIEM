class MatchesController < ApplicationController

  def create
    @place = Place.find(params[:place_id])
    @match = Match.new(matches_params)
    @match.user = current_user
    @match.place = @place
    if @match.save
      redirect_to "/places"
    else
    end
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

  def matches_params
    params.require(:place).permit(:place_id)
  end
end



