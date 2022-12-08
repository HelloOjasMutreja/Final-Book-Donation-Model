class AddCategoryToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :category, null: false, foreign_key: true
  end
end
