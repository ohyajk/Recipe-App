FactoryBot.define do
  factory :user do
    name { 'name' }
    email { Faker::Internet.safe_email }
    password { 'password' }
  end
end
