class GroupShoppingList < ApplicationRecord
  belongs_to :group_shopping
  belongs_to :recipe_ingredient
end
