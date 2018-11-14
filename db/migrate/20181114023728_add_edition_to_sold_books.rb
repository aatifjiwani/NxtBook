class AddEditionToSoldBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_books, :edition, :string
  end
end
