class CreateBoughtBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :bought_books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :isbn, null: false
      t.decimal :price, null: false
      t.integer :condition, null: false
      t.references :user, foreign: true
      t.string :coverphoto
      t.timestamps
    end
    
    add_index :bought_books, [:author]
    add_index :bought_books, [:title]
    add_index :bought_books, [:isbn]
  end
end
