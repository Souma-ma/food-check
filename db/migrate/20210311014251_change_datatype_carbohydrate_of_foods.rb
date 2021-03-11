class ChangeDatatypeCarbohydrateOfFoods < ActiveRecord::Migration[6.0]
  def change
    change_column :foods, :carbohydrate, :float
  end
end
