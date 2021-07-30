class CookingImagesController < ApplicationController
  def destroy
    cooking_image = CookingImage.find(params[:id])
    cooking_image.destroy
    redirect_to recipe_path(params[:recipe_id])
  end
end
