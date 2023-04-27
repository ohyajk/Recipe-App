require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      name: 'John Doe',
      email: 'johndoe@example.com',
      password: 'password123'
    )
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(
      email: 'johndoe@example.com',
      password: 'password123'
    )
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without an email' do
    user = User.new(
      name: 'John Doe',
      password: 'password123'
    )
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is not valid with a duplicate email' do
    User.create(
      name: 'John Doe',
      email: 'johndoe@example.com',
      password: 'password123'
    )
    user = User.new(
      name: 'Jane Smith',
      email: 'johndoe@example.com',
      password: 'password456'
    )
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'has many foods' do
    user = User.new(
      name: 'John Doe',
      email: 'johndoe@example.com',
      password: 'password123'
    )
    expect(user.foods).to be_empty

    food1 = Food.create(name: 'Pizza', user:)
    food2 = Food.create(name: 'Burger', user:)

    expect(user.foods).to include(food1, food2)
  end

  it 'has many recipes' do
    user = User.new(
      name: 'John Doe',
      email: 'johndoe@example.com',
      password: 'password123'
    )
    expect(user.recipes).to be_empty

    recipe1 = Recipe.create(name: 'Chocolate Cake', user:)
    recipe2 = Recipe.create(name: 'Pasta Carbonara', user:)

    expect(user.recipes).to include(recipe1, recipe2)
  end
end
