require_relative '../rails_helper'

RSpec.describe 'The page index page', type: :feature do
    let(:user) { User.create(name: 'Kennedy Owusu', email: 'kenny@gmail.com', password: 'password') }

    before(:each) do
    sign_in(user)
    visit root_path
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end
