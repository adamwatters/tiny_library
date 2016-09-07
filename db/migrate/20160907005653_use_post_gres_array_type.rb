class UsePostGresArrayType < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :categories
  end
end
