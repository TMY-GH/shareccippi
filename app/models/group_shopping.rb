class GroupShopping < ApplicationRecord
  has_many :group_shopping_lists
  has_many :recipe_ingredients, through: :group_shopping_lists  
end
