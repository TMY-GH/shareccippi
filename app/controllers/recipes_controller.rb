class RecipesController < ApplicationController

  def index
  end

  def new
    @recipe = RecipeForm.new
  end

  def create
    @recipe = RecipeForm.new(recipe_params)
    # if @recipe.valid? && @recipe.validates_ingredient_id_and_amount?
    if @recipe.valid?
      @recipe.price.to_i
      @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe_form)
          .permit(:recipe_name, :recipe_image, :minute, :serving, :publish, :price, :content, ingredient_ids: [], amounts: [])
          .merge(user_id: current_user.id)
  end

end
