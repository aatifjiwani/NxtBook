class AddIndexToSoldBooks < ActiveRecord::Migration[5.2]
  def change
    add_index :sold_books, [:author]
    add_index :sold_books, [:title]
    add_index :sold_books, [:isbn]
  end
end
