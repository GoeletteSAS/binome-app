class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard_searches
    @searches = current_user.searches
  end

  def dashboard_profile
    @user = current_user
    @experience = Experience.new(user: current_user)
  end

  def dashboard_favorites
    @user = current_user
  end

  def dashboard_chatrooms
    @chatrooms = current_user.chatrooms
  end
end
