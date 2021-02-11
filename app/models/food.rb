class Food < ApplicationRecord

  with_options presense: true do
    validates :name
    validates :calorie
    validates :protein
    validates :fat
    validates :carbohydrate
  end

  with_options format: {with: /\A[0-9]+\z/} do
    validates :calorie
    validates :protein
    validates :fat
    validates :carbohydrate
  end

  has_one_attached :image
end
