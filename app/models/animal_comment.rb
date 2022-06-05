class AnimalComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_animal
end
