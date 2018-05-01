class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @navbar = true
  end

  def load
  end

  def search
  end
end
