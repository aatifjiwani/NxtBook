class AddEditionToBoughtBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :bought_books, :edition, :string
  end
end
