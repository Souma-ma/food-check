require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @food = FactoryBot.build(:food)
  end

  describe "食材投稿機能" do
    context "食材投稿ができるとき" do
      it "全ての値を正しく入力すれば保存できる" do
        
      end
    end
    context "食材投稿ができないとき" do
      it "nameが空では保存できない" do
        
      end
      it "calorieが空では保存できない" do
        
      end
      it "calorieが半角数字以外では保存できない" do
        
      end
      it "proteinが空では保存できない" do
        
      end
      it "proteinが半角数字以外では保存できない" do
        
      end
      it "fatが空では保存できない" do
        
      end
      it "fatが半角数字以外では保存できない" do
        
      end
      it "carbohydrateが空では保存できない" do
        
      end
      it "carbohydrateが半角数字以外では保存できない" do
        
      end
      it "imageが空では保存できない" do
        
      end
    end
  end
end
