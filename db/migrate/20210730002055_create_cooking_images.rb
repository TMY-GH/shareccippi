class CreateCookingImages < ActiveRecord::Migration[6.0]
  def change
    create_table :cooking_images do |t|
      t.references :recipe,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
