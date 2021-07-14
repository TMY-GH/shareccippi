class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :destroy, :edit, :update]

  def index
    @recipes = Recipe.where(publish_id: "1")
  end

  def show
  end

  def new
    @recipe = RecipeForm.new
  end

  def create
    @recipe = RecipeForm.new(recipe_params_create)
    if @recipe.valid?
      @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @recipe_form = RecipeForm.new(recipe_name: @recipe.name, recipe_image: @recipe.image, minute: @recipe.minute.id, serving: @recipe.serving.id, publish: @recipe.publish.id, price: @recipe.price)
  end

  def update
    @recipe_form = RecipeForm.new(recipe_params_update)
    if @recipe_form.valid?
      @recipe_form.update
      redirect_to recipe_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  private

  def recipe_params_create
    params.require(:recipe_form)
          .permit(:recipe_name, :recipe_image, :minute, :serving, :publish, :price, contents: [], ingredient_ids: [], amounts: [])
          .merge(user_id: current_user.id)
  end

  def recipe_params_update
    params.require(:recipe_form)
          .permit(:recipe_name, :recipe_image, :minute, :serving, :publish, :price, contents: [], ingredient_ids: [], amounts: [])
          .merge(user_id: current_user.id, recipe_id: params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
