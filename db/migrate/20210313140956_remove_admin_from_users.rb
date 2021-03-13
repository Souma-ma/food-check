class RemoveAdminFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :Admin, :boolean
  end
end
