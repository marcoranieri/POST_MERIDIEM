class MatchesController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!


  def create

   params.has_key?("username") ? user = params["username"].to_i : user = current_user.id
     @match = Match.new(user_id: user, place_id: params["place_id"].to_i, status: params["status"])
     @match.save

    redirect_to places_url
  end

  def user_matches
    if params.has_key?(:q)
# search in SQL if found name containing anywhere(%) the value of research
      @user_matches = Match.where(' ILIKE ?', "%#{params[:q]}%")
    else
      @user_matches = Match.where(user_id: current_user)
    end
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
    params.require(:place).permit(:place_id, :status)
  end

end



