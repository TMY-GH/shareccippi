class AddCautionToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :caution, :text
  end
end
