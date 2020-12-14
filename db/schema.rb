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

ActiveRecord::Schema.define(version: 2020_12_14_141531) do

  create_table "boxes", force: :cascade do |t|
    t.string "box_name"
    t.integer "box_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "full_name"
    t.string "user_name", null: false
    t.string "address"
    t.string "tel_num"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
