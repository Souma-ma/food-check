class FoodsController < ApplicationController
  def index
  end

  def new
    @food = Food.new
  end

  def create
  end
end
