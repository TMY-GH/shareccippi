class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name,           null: false
      t.references :user,       null: false, foreing_key: true
      t.timestamps
    end
  end
end
