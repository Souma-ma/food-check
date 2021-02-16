class FoodsController < ApplicationController
  before_action :get_food, only: [:show, :edit]

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

  def show
  end

  def edit
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to root_path
  end

  def search
    @foods = Food.search(params[:keyword])
  end

  
  
  private

  def food_params
    params.require(:food).permit(:image, :name, :calorie, :protein, :fat, :carbohydrate)
  end

  def get_food
    @food = Food.find(params[:id])
  end
  
  
  
end

