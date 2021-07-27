class GroupLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_liked_recipes

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