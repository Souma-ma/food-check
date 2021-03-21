class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } # 半角英数混合
  validates :email, uniqueness: true

  has_many :favorites, dependent: :destroy
  has_many :foods, through: :favorites

  def already_favorited?(food)
    favorites.exists?(food_id: food.id)
  end
end
