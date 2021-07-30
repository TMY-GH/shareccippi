class GroupShopping < ApplicationRecord
  belongs_to :group
  has_many :group_shopping_lists, dependent: :destroy
  has_many :recipe_ingredients, through: :group_shopping_lists  
end
