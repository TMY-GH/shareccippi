class RecipesController < ApplicationController

  def index
  end

  def new
    @recipe = RecipeForm.new
  end

  def create
  end

end
