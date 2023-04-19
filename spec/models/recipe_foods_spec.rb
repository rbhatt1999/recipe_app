require 'rails_helper'

RSpec.describe RecipesController, type: :model do
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Recipe', description: 'Description', cooking_time: '1 hour', preperation_time: '1 hour', user: @user)
    @food = Food.create(name: 'apple', measurement_unit: 'kg', price: 1.5, quantity:45, user: @user)
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 1)
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@recipe).to be_valid
    end
    it 'is not valid without name' do
      @recipe_food.quantity = 0
      expect(@recipe_food).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to recipe' do
      expect(@recipe_food.recipe).to eq(@recipe)
    end
    it 'belongs to food' do
      expect(@recipe_food.food).to eq(@food)
    end
    it 'has quantity' do
      expect(@recipe_food.quantity).to eq(1)
    end
  end
end