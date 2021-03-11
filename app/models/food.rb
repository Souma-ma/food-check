class Food < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :calorie
    validates :protein
    validates :fat
    validates :carbohydrate
    validates :image
  end

  with_options numericality: true do
    validates :calorie
    validates :protein
    validates :fat
    validates :carbohydrate
  end

  has_one_attached :image

  def self.search(search)
    if search != ""
      Food.where('name LIKE(?)', "%#{search}%")
    end
  end
end
