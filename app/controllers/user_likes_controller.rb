class UserLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.user_likes.create(recipe_id: params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    like = UserLike.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
    like.destroy
    @recipe = Recipe.find(params[:recipe_id])
  end

end
