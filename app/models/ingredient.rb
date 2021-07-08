class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  # ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :ingredient_genre

end
