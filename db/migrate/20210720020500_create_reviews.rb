class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :difficulty,    null: false
      t.text :comment
      t.references :user,       null: false, foreign_key: true
      t.references :recipe,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
