class CreateCookings < ActiveRecord::Migration[6.0]
  def change
    create_table :cookings do |t|
      t.text :content, null: false
      # caution削除しました 2021/7/28
      t.text :caution
      t.references :recipe, null: false, foreign_key: true
      t.timestamps
    end
  end
end
