class AddReferenceNumberToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :number, :decimal
  end
end
