class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :gotoplaces

  def gotoplaces
    redirect_to places_path if current_user and root_path == request.path
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

end

