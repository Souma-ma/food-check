class UsersController < ApplicationController
  
  #お気に入りを取得する処理
  def show
    favorites = Favorite.where(user_id: current_user.id).pluck(:food_id)
    @foods = Food.find(favorites)
  end
end
