class CreateGroupLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :group_likes do |t|
      t.references :group,            null: false, foreign_key: true
      t.references :recipe,           null: false, foreign_key: true            
      t.timestamps
    end
  end
end
