class SetBookDefaults < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :available, :boolean, :default => true
    change_column :books, :checked_out_by, :string, :default => ""
  end
end
