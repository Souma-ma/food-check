class FavoritesController < ApplicationController
  before_action :get_food

  def create
    Favorite.create(user_id: current_user.id, food_id: @food.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, food_id: @food.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def get_food
    @food = Food.find(params[:food_id])
  end
end
