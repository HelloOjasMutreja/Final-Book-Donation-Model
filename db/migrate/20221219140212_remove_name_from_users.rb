class RemoveNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name, :string
    remove_column :users, :class, :integer
  end
end
