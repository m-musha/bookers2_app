class AddIsDeletedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_deleted, :boolean, from: true, to: false
  end
end
