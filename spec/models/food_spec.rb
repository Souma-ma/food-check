require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @food = FactoryBot.build(:food)
  end

  describe "食材投稿機能" do
    context "食材投稿ができるとき" do
      it "全ての値を正しく入力すれば保存できる" do
        expect(@food).to be_valid
      end
    end
    context "食材投稿ができないとき" do
      it "nameが空では保存できない" do
        @food.name = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Name can't be blank")
      end
      it "calorieが空では保存できない" do
        @food.calorie = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Calorie can't be blank")
      end
      it "calorieが半角数字以外では保存できない" do
        @food.calorie = '１００'
        @food.valid?
        expect(@food.errors.full_messages).to include("Calorie is not a number")
      end
      it "calorieが負の数では保存できない" do
        @food.calorie = -100
        @food.valid?
        expect(@food.errors.full_messages).to include("Calorie is invalid")
      end
      it "proteinが空では保存できない" do
        @food.protein = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Protein can't be blank")
      end
      it "proteinが半角数字以外では保存できない" do
        @food.protein = '１００'
        @food.valid?
        expect(@food.errors.full_messages).to include("Protein is not a number")
      end
      it "proteinが負の数では保存できない" do
        @food.protein = -100
        @food.valid?
        expect(@food.errors.full_messages).to include("Protein is invalid")
      end
      it "fatが空では保存できない" do
        @food.fat = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Fat can't be blank")
      end
      it "fatが半角数字以外では保存できない" do
        @food.fat = '１００'
        @food.valid?
        expect(@food.errors.full_messages).to include("Fat is not a number")
      end
      it "fatが負の数では保存できない" do
        @food.fat = -100
        @food.valid?
        expect(@food.errors.full_messages).to include("Fat is invalid")
      end
      it "carbohydrateが空では保存できない" do
        @food.carbohydrate = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Carbohydrate can't be blank")
      end
      it "carbohydrateが半角数字以外では保存できない" do
        @food.carbohydrate = '１００'
        @food.valid?
        expect(@food.errors.full_messages).to include("Carbohydrate is not a number")
      end
      it "carbohydrateが負の数では保存できない" do
        @food.carbohydrate = -100
        @food.valid?
        expect(@food.errors.full_messages).to include("Carbohydrate is invalid")
      end
      it "imageが空では保存できない" do
        @food.image = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
