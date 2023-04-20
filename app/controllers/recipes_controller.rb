class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(user: current_user)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.recipe_food.where(recipe: @recipe)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_url, notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  def update
    @recipe.public = !@recipe.public
    @recipe.save
    redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preperation_time, :cooking_time, :description, :public)
  end
end
