class PostAnimal < ApplicationRecord

  belongs_to :user
  has_many :animal_comments,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  validates :caption, presence: true, length: {maximum: 140}
  validates :image, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end