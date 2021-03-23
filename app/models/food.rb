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

  with_options numericality: { greater_than_or_equal_to: 0 } do
    validates :calorie
    validates :protein
    validates :fat
    validates :carbohydrate
  end

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_one_attached :image

  def self.search(search)
    Food.where('name LIKE(?)', "%#{search}%") if search != ''
  end
end
