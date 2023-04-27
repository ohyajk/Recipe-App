FactoryBot.define do
  factory :recipe_food do
    association :food
    association :recipe
  end
end
