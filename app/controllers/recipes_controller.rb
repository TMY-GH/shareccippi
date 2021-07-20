class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :page_next, :page_prev]
  before_action :set_recipe, only: [:show, :destroy, :edit, :update]
  before_action :set_recipe_page, only: [:page_next, :page_prev]
  before_action :set_recipe_step, only: [:index, :search, :page_next, :page_prev]
  before_action :redirect_index, only: :edit

  def index
    # 公開設定のレシピを作成日時が新しい順で表示
    recipes = Recipe.where(publish_id: "1").order("created_at DESC")
    @review_recipes = Recipe.where(publish_id: "1").order("created_at DESC").includes(:review)
    @page = { id: "1"}
    @recipes = recipes[0..(@step - 1)]
    @recipes_len = recipes.length
  end

  def show
    @review = Review.new
    @reviews = @recipe.reviews.where.not(user_id: @recipe.user.id).includes(:user)

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
    @recipe_form = RecipeForm.new(recipe_name: @recipe.name, recipe_image: @recipe.image, minute: @recipe.minute.id, serving: @recipe.serving.id, publish: @recipe.publish.id, price: @recipe.price, difficulty: @recipe.reviews.find_by(user_id: current_user.id).difficulty)
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
    recipes = SearchRecipesService.search(params[:keyword])
    # レシピは9つ表示
    @page = { id: "1"}
    @recipes = recipes[0..(@step - 1)]
    @recipes_len = recipes.length
  end

  # 非同期通信の予測変換用アクション
  def incremental_search
    ingredients = SearchRecipesService.incremental_search(params[:keyword])
    render json:{ keyword: ingredients }
  end

  # レシピのページ送り機能アクション
  def page_next
    first_index = @page * @step
    last_index = ((@page + 1) * @step) - 1;
    recipes = Recipe.where(publish_id: "1").order("created_at DESC")
    @recipes_len = recipes.length
    @recipes = recipes[first_index..last_index]
  end

  def page_prev
    first_index = @page * @step
    last_index = (@page + 1) * @step - 1;
    recipes = Recipe.where(publish_id: "1").order("created_at DESC")
    @recipes_len = recipes.length
    @recipes = recipes[first_index..last_index]
  end
  private

  def recipe_params_create
    params.require(:recipe_form)
          .permit(:recipe_name, :recipe_image, :minute, :serving, :publish, :price, :difficulty, contents: [], ingredient_ids: [], amounts: [])
          .merge(user_id: current_user.id)
  end

  def recipe_params_update
    params.require(:recipe_form)
          .permit(:recipe_name, :recipe_image, :minute, :serving, :publish, :price, :difficulty, contents: [], ingredient_ids: [], amounts: [])
          .merge(user_id: current_user.id, recipe_id: params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_recipe_page
    @page = params[:id].to_i
  end
  def set_recipe_step
    @step = 9
  end

  def redirect_index
    unless user_signed_in? && current_user.id == @recipe.user_id
      redirect_to root_path
    end
  end
end
