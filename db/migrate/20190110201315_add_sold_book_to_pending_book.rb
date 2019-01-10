class AddSoldBookToPendingBook < ActiveRecord::Migration[5.2]
  def change
    add_reference :pending_books, :sold_book, index: true
  end
end
