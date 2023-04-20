require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Recipe', description: 'Description', cooking_time: '1 hour',
                            preperation_time: '1 hour', public: false, user: @user)
    sign_in @user
    visit recipe_path(@recipe)
  end

  it 'renders recipe details' do
    expect(page).to have_content 'Recipe'
  end

  it 'generates shopping list' do
    click_on 'Generate shopping list'
    expect(current_path).to eql '/shopping_list'
  end

  it 'click on add ingredient' do
    click_on 'Add Ingredient'
    expect(current_path).to eql new_recipe_recipe_food_path(@recipe)
  end

  it 'click on public' do
    click_on 'Change Private to public'
    expect(page).to have_content 'Current Status: Public'
  end
end
