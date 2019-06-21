# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_21_114614) do

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "placements", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity", default: 0
    t.index ["order_id"], name: "index_placements_on_order_id"
    t.index ["product_id"], name: "index_placements_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.decimal "price"
    t.boolean "published"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity", default: 0
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "orders", "users"
  add_foreign_key "placements", "orders"
  add_foreign_key "placements", "products"
  add_foreign_key "products", "users"
end
