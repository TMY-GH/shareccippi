class GroupLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:new, :create]
  before_action :set_liked_recipes, only: [:new, :create]

  def new
    @group_like = GroupLike.new
  end

  def create
    if params[:group_like].present?
      recipe_ids = params[:group_like][:recipe_ids]
      recipe_ids.each do |recipe_id|
        GroupLike.create(group_id: params[:group_id], recipe_id: recipe_id)
      end
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    liked_recipe = GroupLike.find_by(group_id: params[:group_id], recipe_id: params[:id])
    liked_recipe.destroy
    redirect_to group_path(params[:group_id])
  end
  

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_liked_recipes
    favorites = current_user.favorites.order("created_at DESC")
    liked_recipe = @group.recipes
    @recipes = favorites - liked_recipe
  end

end