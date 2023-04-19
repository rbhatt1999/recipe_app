require 'rails_helper'

RSpec.describe 'The page index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Hassan', email: 'hassan@example.com', password: '123456', confirmed_at: Time.now)
      @food1 = Food.create!(name: 'Appel', measurement_unit: 'kg', quantity: 5, price: 4, user_id: @user1.id)

      visit user_session_path
      fill_in 'Email', with: 'hassan@example.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'Navigate to the create new food page' do
      visit foods_path
      click_on 'Add food'
      expect(current_path).to eql new_food_path
    end

    it 'has a button to create new food' do
      visit foods_path
      expect(page).to have_content 'Add food'
    end

    it 'show food name' do
      visit foods_path
      expect(page).to have_content @food1.name
    end

    it 'show food measurement unit ' do
      visit foods_path
      expect(page).to have_content @food1.measurement_unit
    end

    it 'show food quantity' do
      visit foods_path
      expect(page).to have_content @food1.quantity
    end

    it 'show food price' do
      visit foods_path
      expect(page).to have_content @food1.price
    end
  end
end
