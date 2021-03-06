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

ActiveRecord::Schema.define(version: 2021_01_20_114703) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "bento_id", null: false
    t.integer "dish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bento_id"], name: "index_assignments_on_bento_id"
    t.index ["dish_id"], name: "index_assignments_on_dish_id"
  end

  create_table "associations", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "sub_dish_id", null: false
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_associations_on_cart_id"
    t.index ["sub_dish_id"], name: "index_associations_on_sub_dish_id"
  end

  create_table "bentos", force: :cascade do |t|
    t.integer "box_id"
    t.integer "cart_id"
    t.integer "sum_kcal"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_bentos_on_box_id"
    t.index ["cart_id"], name: "index_bentos_on_cart_id"
  end

  create_table "boxes", force: :cascade do |t|
    t.integer "box_num"
    t.string "box_name"
    t.integer "box_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "sum_price"
    t.integer "all_kcal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_carts_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "full_name"
    t.string "user_name", null: false
    t.string "address"
    t.string "tel_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "dish_name"
    t.boolean "recommend", default: false, null: false
    t.string "introduction"
    t.integer "dish_kcal"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "model1s", force: :cascade do |t|
    t.string "orders_type", default: "Photo"
    t.integer "orders_id"
    t.integer "bento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orders_type", "orders_id"], name: "index_model1s_on_orders_type_and_orders_id"
  end

  create_table "order_bentos", force: :cascade do |t|
    t.integer "order_id"
    t.integer "bento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_bentos_on_order_id"
  end

  create_table "order_subdishes", force: :cascade do |t|
    t.integer "order_id"
    t.integer "sub_dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_subdishes_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "all_kcal"
    t.integer "sum_price"
    t.datetime "reserve_date"
    t.datetime "deliver_date"
    t.string "deliver_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "sub_dishes", force: :cascade do |t|
    t.string "sub_dish_name"
    t.integer "sub_dish_price"
    t.boolean "recommend", default: false, null: false
    t.string "introduction"
    t.integer "sub_kcal"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
