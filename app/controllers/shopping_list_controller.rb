class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.where(user: @user)
    @ingredients = RecipeFood.where(recipe: @recipe)
    @total_price = @ingredients.map { |ingredient| ingredient.quantity * ingredient.food.price }.sum
  end
end
