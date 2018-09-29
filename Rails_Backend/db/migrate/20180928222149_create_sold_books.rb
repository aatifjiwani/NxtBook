class CreateSoldBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :sold_books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :isbn, null: false
      t.decimal :price, null: false
      t.integer :condition, null: false
      t.references :user, foreign: true
      t.timestamps
    end
  end
end
