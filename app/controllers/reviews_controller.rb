class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to recipe_path(@recipe)
    else
      render "recipes/show"
    end
  end
  
  def destroy
    review = Review.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
    review.destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private
  def review_params
    params.require(:review)
          .permit(:difficulty, :comment)
          .merge(user_id: current_user.id, recipe_id: @recipe.id)
  end
end
