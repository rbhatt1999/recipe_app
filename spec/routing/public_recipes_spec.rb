require 'rails_helper'

RSpec.describe PublicRecipesController, type: :routing do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'test', email: 'asasd@gmail.com', password: '123456', confirmed_at: Time.now) }
  let(:recipe) do
    Recipe.create(name: 'Recipe', description: 'Description', public: true, cooking_time: '1 hour',
                  preperation_time: '1 hour', user:)
  end
  describe 'routing' do
    before do
      sign_in user
    end
    it 'routes to #index' do
      expect(get: '/public_recipes').to route_to('public_recipes#index')
    end
  end
end
