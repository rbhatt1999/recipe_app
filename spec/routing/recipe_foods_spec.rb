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
    it 'routes to #new' do
      expect(get: "/recipes/#{recipe.id}/recipe_foods/new").to route_to('recipe_foods#new',
                                                                        recipe_id: recipe.id.to_s)
    end
    it 'creates a new recipe' do
      expect(post: "/recipes/#{recipe.id}/recipe_foods").to route_to('recipe_foods#create',
                                                                     recipe_id: recipe.id.to_s)
    end
    it 'routes to #destroy' do
      expect(delete: "/recipes/#{recipe.id}/recipe_foods/1").to route_to('recipe_foods#destroy',
                                                                         recipe_id: recipe.id.to_s, id: '1')
    end
    it 'routes to #edit' do
      expect(get: "/recipes/#{recipe.id}/recipe_foods/1/edit").to route_to('recipe_foods#edit',
                                                                           recipe_id: recipe.id.to_s, id: '1')
    end
    it 'routes to #update' do
      expect(patch: "/recipes/#{recipe.id}/recipe_foods/1").to route_to('recipe_foods#update',
                                                                        recipe_id: recipe.id.to_s, id: '1')
    end
  end
end
