require_relative '../rails_helper'

RSpec.describe 'The page index page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Luis', email: 'labarca@gmail.com', password: '123456')
    @user1.save
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    visit root_path
  end
end
