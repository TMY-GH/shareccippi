class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name,           null: false
      t.integer :minute_id,     null: false
      t.integer :serving_id,    null: false
      t.integer :publish_id,    null: false
      t.integer :price
      t.references :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
