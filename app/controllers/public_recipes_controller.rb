class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order('created_at DESC')
    @ingredients = RecipeFood.all
  end
end
