class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard_searches
    @searches = current_user.searches
    @favorite = Favorite.new(user_1_id: current_user.id)
  end

  def dashboard_profile
    @user = current_user
    @experience = Experience.new(user: current_user)
    @lines_of_work = Search::LINES_OF_WORK
    @fields = Search::FIELDS
  end

  def dashboard_favorites
    @user = current_user
    @favorites = current_user.favorites
  end

  def dashboard_chatrooms
    @chatrooms = current_user.chatrooms
  end
end
