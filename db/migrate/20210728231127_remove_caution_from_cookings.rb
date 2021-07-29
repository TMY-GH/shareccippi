class RemoveCautionFromCookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :cookings, :caution
  end
end
