class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  has_many :group_shopping_lists, dependent: :destroy
  has_many :group_shoppings, through: :group_shopping_lists
end
