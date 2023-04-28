require 'rails_helper'

RSpec.describe 'Recipe Food page', type: :feature do
  let!(:user) { User.create!(name: 'Kennedy Owusu', email: 'kenny@gmail.com', password: 'password') }
  let!(:recipe1) do
    Recipe.create!(name: 'Test 1', description: 'test description 1', public: true, preparation_time: 10,
                   cooking_time: 10, user:)
  end
  let!(:recipe2) { Recipe.create!(name: 'Test Recipe 2', description: 'test description 2', public: false, user:) }

  before(:each) do
    sign_in(user)
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  it 'should display all recipes' do
    visit user_recipes_path(user.id)
    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe2.name)
    expect(page).to have_content(recipe1.description)
    expect(page).to have_content(recipe2.description)
  end

  it 'should show remove and New Recipe button' do
    visit user_recipes_path(user.id)
    expect(page).to have_content('New Recipe')
    expect(page).to have_content('Remove')
  end

  it 'should show recipe show page' do
    visit user_recipes_path(user.id)
    click_on recipe1.name
    expect(page).to have_content(recipe1.name)
    expect(page).to have_content('Generate Shopping List')
    expect(page).to have_content('Add Ingredient')
  end

  it 'should take you to shopping list page' do
    visit user_recipe_path(user.id, recipe1.id)
    click_on 'Generate Shopping List'
    expect(page).to have_content('Shopping List')
  end
end
