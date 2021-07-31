class GroupShoppingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :redirect_mygroup

  def show
    @group_shopping = @group.group_shopping
    group_shopping_lists = GroupShoppingList.where(group_shopping_id: @group_shopping.id)

    @recipe_ingredients = []
    ingredient_ids = []
    group_shopping_lists.each do |list|
      # 追加する材料
      ingredient = RecipeIngredient.find(list.recipe_ingredient_id)
      # 追加する材料が既にあった場合
      if ingredient_ids.include?(ingredient.ingredient_id)
        i = 0
        # 場所を特定し、量に追加
        @recipe_ingredients.each do |recipe_ingredient|
          if recipe_ingredient.ingredient_id == ingredient.ingredient_id
            sum = recipe_ingredient.amount.to_i + ingredient.amount.to_i
            @recipe_ingredients[i].amount = sum.to_s
          end
          i += 1
        end
      else
        @recipe_ingredients.push(ingredient)
      end
      ingredient_ids.push(ingredient.ingredient_id)
    end
  end

  def new
    @recipes = @group.recipes
    @group_shopping = GroupShopping.new
  end

  def create
    unless @group.group_shopping.blank?
      @group.group_shopping.destroy
    end
    if params[:group_shopping].present?
      group_shopping = GroupShopping.create(group_id: params[:group_id])
      recipe_ids = params[:group_shopping][:recipe_ids]
      recipe_ids.each do |recipe_id|
        recipe = Recipe.find(recipe_id)
        recipe.recipe_ingredients.each do |ingredient|
          GroupShoppingList.create(group_shopping_id: group_shopping.id, recipe_ingredient_id: ingredient.id)
        end
      end
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def redirect_mygroup
    unless @group.users.include?(current_user)
      redirect_to groups_path
    end
  end

end
