class AddColumnToSoldBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_books, :coverphoto, :string
  end
end
