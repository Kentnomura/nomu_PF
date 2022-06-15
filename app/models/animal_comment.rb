class AnimalComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_animal

  validates :comment, presence: true, length: {maximum: 40}
end
