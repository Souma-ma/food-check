class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
    favorites = Favorite.where(user_id: current_user.id).pluck(:food_id)
    @foods = Food.find(favorites)
  end
end
