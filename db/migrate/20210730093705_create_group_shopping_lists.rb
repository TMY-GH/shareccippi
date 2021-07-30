class CreateGroupShoppingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :group_shopping_lists do |t|
      t.references :group_shopping,              null: false, foreign_key: true
      t.references :recipe_ingredient,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
