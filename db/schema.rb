# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_22_083853) do

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "secret"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.date "publication_date"
    t.integer "user_id"
    t.integer "store_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "publishing_house_id"
    t.index ["publishing_house_id"], name: "index_books_on_publishing_house_id"
    t.index ["store_id"], name: "index_books_on_store_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "discount", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "publishing_houses", force: :cascade do |t|
    t.string "name"
    t.string "tel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "secret"
    t.integer "grade", limit: 1
  end

  create_table "stores_books", force: :cascade do |t|
    t.integer "store_id"
    t.integer "book_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_stores_books_on_book_id"
    t.index ["store_id"], name: "index_stores_books_on_store_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "tel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "level", default: 0
    t.string "secret"
    t.boolean "public", default: false, null: false
  end

end
