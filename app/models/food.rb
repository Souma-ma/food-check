class Food < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :calorie
    validates :protein
    validates :fat
    validates :carbohydrate
    validates :image
  end

  with_options numericality: {only_integer: true} , format: { with: /\A[0-9]+\z/ } do
    validates :calorie
    validates :protein
    validates :fat
    validates :carbohydrate
  end

  has_one_attached :image

  def self.search(search)
    if search != ""
      Food.where('name LIKE(?)', "%#{search}%")
    else
      Food.all
    end
  end
end
