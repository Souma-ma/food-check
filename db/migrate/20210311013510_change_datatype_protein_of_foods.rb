class ChangeDatatypeProteinOfFoods < ActiveRecord::Migration[6.0]
  def change
    change_column :foods, :protein, :float
  end
end
