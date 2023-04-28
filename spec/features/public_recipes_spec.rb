require_relative '../rails_helper'

RSpec.describe 'The public recipes page', type: :feature do
  let!(:user) { User.create!(name: 'Kennedy Owusu', email: 'kenny@gmail.com', password: 'password') }
  let!(:recipe1) do
    Recipe.create!(name: 'First Test', description: 'test description 1', public: true, preparation_time: 10,
                   cooking_time: 10, user:)
  end
  let!(:recipe2) do
    Recipe.create!(name: 'Second Test Recipe', description: 'test description 2', public: false, user:)
  end

  it 'should display all public recipes' do
    visit public_recipes_path
    expect(page).to have_content('Total Food Items')
    expect(page).to have_content('Total Price')
    expect(page).to have_content(recipe1.name)
    expect(page).to have_content("By: #{user.name}")
  end
end
