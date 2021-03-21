require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @food = FactoryBot.build(:food)
  end

  describe '食材投稿機能' do
    context '食材投稿ができるとき' do
      it '全ての値を正しく入力すれば保存できる' do
        expect(@food).to be_valid
      end
    end
    context '食材投稿ができないとき' do
      it 'nameが空では保存できない' do
        @food.name = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Nameを入力してください")
      end
      it 'calorieが空では保存できない' do
        @food.calorie = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Calorieを入力してください", "Calorieは数値で入力してください")
      end
      it 'calorieが半角数字以外では保存できない' do
        @food.calorie = '１００'
        @food.valid?
        expect(@food.errors.full_messages).to include("Calorieは数値で入力してください")
      end
      it 'calorieが負の数では保存できない' do
        @food.calorie = -1
        @food.valid?
        expect(@food.errors.full_messages).to include("Calorieは0以上の値にしてください")
      end
      it 'proteinが空では保存できない' do
        @food.protein = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Proteinを入力してください", "Proteinは数値で入力してください")
      end
      it 'proteinが半角数字以外では保存できない' do
        @food.protein = '１００'
        @food.valid?
        expect(@food.errors.full_messages).to include("Proteinは数値で入力してください")
      end
      it 'proteinが負の数では保存できない' do
        @food.protein = -1
        @food.valid?
        expect(@food.errors.full_messages).to include("Proteinは0以上の値にしてください")
      end
      it 'fatが空では保存できない' do
        @food.fat = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Fatを入力してください", "Fatは数値で入力してください")
      end
      it 'fatが半角数字以外では保存できない' do
        @food.fat = '１００'
        @food.valid?
        expect(@food.errors.full_messages).to include("Fatは数値で入力してください")
      end
      it 'fatが負の数では保存できない' do
        @food.fat = -1
        @food.valid?
        expect(@food.errors.full_messages).to include("Fatは0以上の値にしてください")
      end
      it 'carbohydrateが空では保存できない' do
        @food.carbohydrate = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Carbohydrateを入力してください", "Carbohydrateは数値で入力してください")
      end
      it 'carbohydrateが半角数字以外では保存できない' do
        @food.carbohydrate = '１００'
        @food.valid?
        expect(@food.errors.full_messages).to include("Carbohydrateは数値で入力してください")
      end
      it 'carbohydrateが負の数では保存できない' do
        @food.carbohydrate = -1
        @food.valid?
        expect(@food.errors.full_messages).to include("Carbohydrateは0以上の値にしてください")
      end
      it 'imageが空では保存できない' do
        @food.image = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Imageを入力してください")
      end
    end
  end
end
