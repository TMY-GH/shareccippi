class CreateGroupShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :group_shoppings do |t|
      t.text :memo
      t.references :group,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
