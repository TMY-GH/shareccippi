class UsersController < ApplicationController
  before_action :redirect_index
  before_action :set_user

  def show
    @recipes = @user.recipes.order("created_at DESC")
  end

  # マイレシピを「全部、公開、非公開」でレシピの表示を変える
  def select_publish
    select_id = params[:select_publish_form][:publish]
    case select_id
    when "1"
      @recipes = @user.recipes.order("created_at DESC")
    when "2"
      @recipes = @user.recipes.where(publish_id: 1).order("created_at DESC")
    when "3"
      @recipes = @user.recipes.where(publish_id: 2).order("created_at DESC")
    end
  end
  
  # お気に入りのレシピを表示させる
  def favorites
    @liked_recipes = @user.favorites.order("created_at DESC")
  end
  # マイレシピを表示させる
  def my_recipes
    @recipes = @user.recipes.order("created_at DESC")
  end

  private
  def redirect_index
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
