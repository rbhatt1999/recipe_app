require 'rails_helper'

RSpec.describe RecipesController, type: :model do
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Recipe', description: 'Description', cooking_time: '1 hour',
                            preperation_time: '1 hour', user: @user)
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@recipe).to be_valid
    end
  end
  describe 'associations' do
    it 'belongs to user' do
      expect(@recipe.user).to eq(@user)
    end
    it 'has name' do
      expect(@recipe.name).to eq('Recipe')
    end
    it 'has description' do
      expect(@recipe.description).to eq('Description')
    end
    it 'has cooking time' do
      expect(@recipe.cooking_time).to eq('1 hour')
    end
    it 'has preperation time' do
      expect(@recipe.preperation_time).to eq('1 hour')
    end
  end
end
