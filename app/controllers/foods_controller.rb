class FoodsController < ApplicationController
  def index
    @foods = Food.all.page(params[:page]).per(4)
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

  def search
    @foods = Food.search(params[:keyword])
  end

  
  
  private

  def food_params
    params.require(:food).permit(:image, :name, :calorie, :protein, :fat, :carbohydrate)
  end 
  
  
  
end

