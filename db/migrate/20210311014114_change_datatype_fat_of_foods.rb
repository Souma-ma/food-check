class ChangeDatatypeFatOfFoods < ActiveRecord::Migration[6.0]
  def change
    change_column :foods, :fat, :float
  end
end
