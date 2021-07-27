class GroupLikesController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @recipes = current_user.recipes.order("created_at DESC")
    @group_like = GroupLike.new
  end

  def create
    binding.pry
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
