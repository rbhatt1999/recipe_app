require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asd@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Recipe', description: 'Description', cooking_time: '1 hour',
                            preperation_time: '1 hour', user: @user)
    @food = Food.create(name: 'apple', measurement_unit: 'kg', price: 1.5, quantity: 45, user: @user)
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 1)
  end
  describe 'GET /new' do
    before do
      sign_in @user
      get new_recipe_recipe_food_path(@recipe)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'Add Ingredient'
    end
  end

  describe 'POST /create' do
    before do
      sign_in @user
      post recipe_recipe_foods_path(@recipe),
           params: { recipe_food: { recipe_id: @recipe.id, food_id: @food.id, quantity: 1 } }
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:found)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /edit' do
    before do
      sign_in @user
      get edit_recipe_recipe_food_path(@recipe, @recipe_food)
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'Edit Ingredient' do
      expect(response.body).to include 'Edit Ingredient'
    end
  end

  describe 'PATCH /update' do
    before do
      sign_in @user
      patch recipe_recipe_food_path(@recipe, @recipe_food),
            params: { recipe_food: { recipe_id: @recipe.id, food_id: @food.id, quantity: 1 } }
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:found)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
  describe 'DELETE /destroy' do
    before do
      sign_in @user
      delete recipe_recipe_food_path(@recipe, @recipe_food)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:found)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
