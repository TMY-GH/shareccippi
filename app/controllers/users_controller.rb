class UsersController < ApplicationController
  before_action :redirect_index

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
    @liked_recipes = @user.favorites
  end

  private

  def redirect_index
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end
  end
end
