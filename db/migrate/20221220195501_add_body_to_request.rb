class AddBodyToRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :body, :text
  end
end
