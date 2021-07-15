class UserLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = current_user.user_likes.create(recipe_id: params[:recipe_id])
    redirect_to root_path
  end

  def destroy
    like = UserLike.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
    like.destroy
    redirect_to root_path
  end
end
