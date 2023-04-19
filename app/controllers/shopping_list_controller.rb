class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.where(user: @user)
    @ingredients = RecipeFood.where(recipe: @recipe).group_by { |ingredient| ingredient.food.name }
    @total_price = @ingredients.map do |_food, ingredients|
      ingredients.map do |ingredient|
        ingredient.quantity * ingredient.food.price
      end.sum
    end.sum
  end
end
