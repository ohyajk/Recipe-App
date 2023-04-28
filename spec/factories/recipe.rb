FactoryBot.define do
  factory :recipe do
    association :user
    after(:create) do |recipe|
      create_list(:recipe_food, 3, recipe: recipe)
    end
  end
end
