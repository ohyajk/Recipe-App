class RecipeFood < ApplicationRecord
  belongs_to :foodlist
  belongs_to :recipelist
end
