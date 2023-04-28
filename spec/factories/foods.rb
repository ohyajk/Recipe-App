FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    measurement_unit { %w[kg g ml cl].sample }
    price { Faker::Number.between(from: 100, to: 1000) }
    quantity { Faker::Number.between(from: 1, to: 10) }
    user { association(:user) }
  end
end
