class UsersController < ApplicationController
  before_action :redirect_index

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
    @liked_recipes = @user.favorites
  end

  def select_publish
    select_id = params[:select_publish_form][:publish]
    user = User.find(params[:id])
    case select_id
    when "1"
      @recipes = user.recipes
    when "2"
      @recipes = user.recipes.where(publish_id: 1)
    when "3"
      @recipes = user.recipes.where(publish_id: 2)
    end
  end
  
  private
  def redirect_index
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end
  end
end
