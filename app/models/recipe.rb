class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :cookings, dependent: :destroy

# ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :minute
    belongs_to :serving
    belongs_to :publish

end
