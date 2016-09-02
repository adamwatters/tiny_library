class AddStatusAndHolderToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :available, :boolean, :default => true
    add_column :books, :checked_out_by, :string, :default => ""
  end
end
