FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Food #{n}" }
    measurement_unit { %w[kg g ml cl].sample }
    price { rand(100..1000) }
    quantity { rand(1..10) }
    association :user

    trait :with_specific_user do
      association :user, factory: :user_with_specific_attributes
    end

    trait :with_recipe_food do
      after(:create) do |food|
        create_list(:recipe_food, 3, food:)
      end
    end
  end
end
