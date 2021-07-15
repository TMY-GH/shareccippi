class UserLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = current_user.favorites.create(recipe_id: params[:recipe_id])
    redirect_to root_path
  end

  def destroy
    like = UserLike.find(user_id: current_user.id, recipe_id: params[:redipe_id])
    like.destroy
    redirect_to root_path
  end
end
