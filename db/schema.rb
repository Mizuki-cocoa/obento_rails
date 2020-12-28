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

ActiveRecord::Schema.define(version: 2020_12_28_084938) do

  create_table "bentos", force: :cascade do |t|
    t.integer "sum_kcal"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boxes", force: :cascade do |t|
    t.string "box_name"
    t.integer "box_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "sum_price"
    t.integer "all_kcal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "orders", force: :cascade do |t|
    t.date "reserve_date"
    t.date "deliver_date"
    t.string "deliver_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "subnums", force: :cascade do |t|
    t.integer "sum_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
