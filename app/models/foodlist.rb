class Foodlist < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
end
