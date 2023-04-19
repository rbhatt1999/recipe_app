require 'rails_helper'

RSpec.describe RecipesController, type: :routing do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'test', email: 'asasd@gmail.com', password: '123456', confirmed_at: Time.now) }
  let(:recipe) do
    Recipe.create(name: 'Recipe', description: 'Description', cooking_time: '1 hour', preperation_time: '1 hour', user:)
  end
  describe 'routing' do
    before do
      sign_in user
    end
    it 'routes to #index' do
      expect(get: '/recipes').to route_to('recipes#index')
    end
    it 'routes to #new' do
      expect(get: '/recipes/new').to route_to('recipes#new')
    end
    it 'routes to #show' do
      expect(get: "/recipes/#{recipe.id}").to route_to('recipes#show', id: recipe.id.to_s)
    end
    it 'creates a new recipe' do
      expect(post: '/recipes').to route_to('recipes#create')
    end
    it 'routes to #destroy' do
      expect(delete: "/recipes/#{recipe.id}").to route_to('recipes#destroy', id: recipe.id.to_s)
    end
  end
end
