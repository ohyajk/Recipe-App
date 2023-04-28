require 'rails_helper'

RSpec.describe 'Log In page', type: :feature do
  let(:user) { User.create(name: 'Kennedy Owusu', email: 'kenny@gmail.com', password: 'password') }

  before(:each) do
    sign_in_page
  end

  def sign_in_page
    visit new_user_session_path
  end

  it 'should have a log in form' do
    expect(page).to have_selector('form')
  end

  it 'should have a log in button' do
    expect(page).to have_button('Log in')
  end
end

