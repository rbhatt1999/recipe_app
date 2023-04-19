require 'rails_helper'

RSpec.describe 'recipes_food/edit', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Recipe', description: 'Description', cooking_time: '1 hour',
                            preperation_time: '1 hour', public: false, user: @user)
    @food = Food.create(name: 'apple', measurement_unit: 'kg', price: 1.5, quantity: 45, user: @user)
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 1)
    sign_in @user
    visit edit_recipe_recipe_food_path(@recipe, @recipe_food)
  end

  it 'renders new recipe food form' do
    expect(page).to have_content 'Edit Ingredient'
  end

  it 'has a select field for food' do
    expect(page).to have_select('recipe_food[food_id]')
  end
  it 'has a quantity field' do
    expect(page).to have_field('recipe_food[quantity]')
  end

  it 'has a select field for food' do
    fill_in 'recipe_food[quantity]', with: 2
    find('#recipe_food_food_id').find(:xpath, 'option[1]').select_option
    click_on 'Add Ingredient'
  end
end
