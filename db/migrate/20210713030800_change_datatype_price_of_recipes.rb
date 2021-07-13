class ChangeDatatypePriceOfRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :price, :string
  end
end
