class CreateIndexForCategories < ActiveRecord::Migration[5.0]
  def change
    add_index  :books, :categories, using: 'gin'
  end
end
