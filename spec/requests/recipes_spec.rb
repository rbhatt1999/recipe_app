require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asd@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Recipe', description: 'Description', cooking_time: '1 hour',
                            preperation_time: '1 hour', user: @user)
  end
  describe 'GET /index' do
    before do
      sign_in @user
      get recipes_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'Recipe'
    end
  end

  describe 'GET /show' do
    before do
      sign_in @user
      get recipe_path(@recipe)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'Recipe'
    end
  end

  describe 'GET /new' do
    before do
      sign_in @user
      get new_recipe_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'contains the correct content' do
      expect(response.body).to include 'New recipe'
    end
  end
end
