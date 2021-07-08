class RecipesController < ApplicationController

  def index
  end

  def new
    @recipe = RecipeForm.new
  end

  def create
    @recipe = RecipeForm.new(recipe_params)
    if @recipe.valid?
      @recipe.price.to_i
      @recipe.amount.to_i
      @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe_form)
          .permit(:recipe_name, :recipe_image, :minute, :serving, :publish, :price, :ingredient_id, :amount, :content)
          .merge(user_id: current_user.id)
  end

end
