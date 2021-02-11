class FoodsController < ApplicationController
  def index
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  
  
  private

  def food_params
    params.require(:food).permit(:image, :name, :calorie, :protein, :fat, :carbohydrate)
  end 
  
  
  
end

