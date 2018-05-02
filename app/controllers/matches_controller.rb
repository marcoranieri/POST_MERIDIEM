class MatchesController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!


  def create

    status = params["status"] || params["place"]["status"]

   params.has_key?("username") ? user = params["username"].to_i : user = current_user.id
     @match = Match.new(user_id: user, place_id: params["place_id"].to_i, status: status)
     @match.save


    redirect_to places_path(kind: params[:kind])
  end

  def user_matches
    @user_matches = Match.where(user_id: current_user.id, status: "yes").order("created_at desc")
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



