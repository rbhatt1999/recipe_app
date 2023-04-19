require 'rails_helper'

RSpec.describe PublicRecipesController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:example) do
  @user = User.create(name: 'Kolly', email: 'asd@gmail.com', password: 'password', confirmed_at: Time.now)
  @recipe = Recipe.create(name: 'Recipe', description: 'Description', public:true, cooking_time: '1 hour', preperation_time: '1 hour', user: @user)
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
end