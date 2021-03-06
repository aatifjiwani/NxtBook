# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_10_201315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bought_books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.string "isbn", null: false
    t.decimal "price", null: false
    t.integer "condition", null: false
    t.bigint "user_id"
    t.string "coverphoto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "edition"
    t.index ["author"], name: "index_bought_books_on_author"
    t.index ["isbn"], name: "index_bought_books_on_isbn"
    t.index ["title"], name: "index_bought_books_on_title"
    t.index ["user_id"], name: "index_bought_books_on_user_id"
  end

  create_table "jwt_blacklist", id: :serial, force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "pending_books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.string "isbn", null: false
    t.decimal "price", null: false
    t.integer "condition", null: false
    t.bigint "user_id"
    t.string "coverphoto"
    t.string "edition", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sold_book_id"
    t.index ["sold_book_id"], name: "index_pending_books_on_sold_book_id"
    t.index ["user_id"], name: "index_pending_books_on_user_id"
  end

  create_table "selling_books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.string "isbn", null: false
    t.decimal "price", null: false
    t.integer "condition", null: false
    t.bigint "user_id"
    t.string "coverphoto"
    t.string "edition", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_selling_books_on_user_id"
  end

  create_table "sold_books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.string "isbn", null: false
    t.decimal "price", null: false
    t.integer "condition", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coverphoto"
    t.string "edition"
    t.index ["author"], name: "index_sold_books_on_author"
    t.index ["isbn"], name: "index_sold_books_on_isbn"
    t.index ["title"], name: "index_sold_books_on_title"
    t.index ["user_id"], name: "index_sold_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "profilepicture", default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
