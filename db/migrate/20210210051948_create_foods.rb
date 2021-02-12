class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name,          null: false
      t.integer :calorie,      null: false
      t.integer :protein,      null: false
      t.integer :fat,          null: false
      t.integer :carbohydrate, null: false
      t.timestamps
    end
  end
end
