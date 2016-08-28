class ChangeNumberFromStringToDecimal < ActiveRecord::Migration[5.0]
  def up
    change_column :books, :number, :decimal
  end

  def down
    change_column :books, :number, :string
  end
end
