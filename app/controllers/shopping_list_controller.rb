class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.where(user: @user)
    @ingredients = RecipeFood.where(recipe: @recipe)
  end
end