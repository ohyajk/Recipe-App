FactoryBot.define do
  factory :recipe do
    sequence(:title) { |n| "Recipe #{n}" }
    description { Faker::Lorem.sentence }
    user { association :user }

    trait :with_recipe_foods do
      after(:create) do |recipe|
        create_list(:recipe_food, 3, recipe:)
      end
    end
  end
end
