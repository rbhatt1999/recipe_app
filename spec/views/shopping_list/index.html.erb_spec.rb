require 'rails_helper'

RSpec.describe 'Recipe app', type: :feature do
  describe ' Recipe show page' do
    before(:each) do
      @user1 = User.create!(name: 'hassan', email: 'hassan@gmail.com', password: '123456', confirmed_at: Time.now)
      visit user_session_path
      fill_in 'Email', with: 'hassan@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      @recipe1 = Recipe.create(name: 'recipe1', cooking_time: 2, preperation_time: 1,
                               description: 'recipe1 description', public: true, user_id: @user1.id)
      @food = Food.create(name: 'orange', price: 3, measurement_unit: 'kg', quantity: 2, user_id: @user1.id,
                          created_at: Time.now)
      @recipe_food = RecipeFood.create(food_id: @food.id, recipe_id: @recipe1.id, quantity: 2, created_at: Time.now)
      visit shopping_list_path
    end

    it 'Should see the heading' do
      expect(page).to have_content('Shopping List')
    end

    it 'Should see first text amount of food' do
      expect(page).to have_content('Amount of food items to buy:')
    end

    it 'Should see second text total value of food' do
      expect(page).to have_content('Total value of food needed')
    end

    it 'Should see recipe foods table' do
      expect(page).to have_content('Food')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Price')
    end

    it 'Should see the food name' do
      expect(page).to have_content(@food.name)
    end

    it 'Amount of food items to buy' do
      expect(page).to have_content('Amount of food items to buy: 1')
    end

    it 'Total value of food needed' do
      expect(page).to have_content('Total value of food needed: $6')
    end

    it 'Should see the price column' do
      price = @food.price * @recipe_food.quantity
      expect(page).to have_content("$#{price}")
    end

    it 'Should see the quantity column' do
      expect(page).to have_content("#{@recipe_food.quantity} kg")
    end
  end
end
