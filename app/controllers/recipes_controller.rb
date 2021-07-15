class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_recipe, only: [:show, :destroy, :edit, :update]
  before_action :redirect_index, only: :edit

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
    @ingredients = @recipe.recipe_ingredients
    @cookings = @recipe.cookings
  end

  def update
    @recipe_form = RecipeForm.new(recipe_params_update)
    if @recipe_form.valid?
      @recipe_form.update
      redirect_to recipe_path(params[:id])
    else
      @ingredients = @recipe.recipe_ingredients
      @cookings = @recipe.cookings
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  def search
    @recipes = SearchRecipesService.search(params[:keyword])
  end

  # 非同期通信の予測変換用アクション
  def incremental_search
    ingredients = SearchRecipesService.incremental_search(params[:keyword])
    render json:{ keyword: ingredients }
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

  def redirect_index
    unless user_signed_in? && current_user.id == @recipe.user_id
      redirect_to root_path
    end
  end
end
