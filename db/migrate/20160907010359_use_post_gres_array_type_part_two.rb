class UsePostGresArrayTypePartTwo < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :categories, :text, array:true, default: []
  end
end
