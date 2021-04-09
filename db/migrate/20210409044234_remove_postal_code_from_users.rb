class RemovePostalCodeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :postal_code, :integer
  end
end
