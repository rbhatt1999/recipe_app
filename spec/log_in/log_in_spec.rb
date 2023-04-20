require 'rails_helper'
RSpec.feature 'Login', type: :feature do
  before :each do
    User.create(name: 'Hassan', email: 'hassan@gmail.com', password: '123456', confirmed_at: Time.now)
    visit user_session_path
  end

  it 'I can see the email, password and the Submit button' do
    expect(page).to have_content('Email')
    expect(page).to have_content('password')
    expect(page).to have_content('Log in')
  end

  it 'user can see correct path' do
    expect(page).to have_current_path(user_session_path)
  end

  it 'click the login without email and password data' do
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Signed in successfully' do
    fill_in 'Email', with: 'hassan@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'Login successfully' do
    fill_in 'Email', with: 'hassan@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_current_path(root_path)
  end
end
