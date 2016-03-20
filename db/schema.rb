# encoding: UTF-8
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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160320172947) do
=======
ActiveRecord::Schema.define(version: 20160318163456) do
>>>>>>> de33097513c436ed2c6cffe448fc3ff9cb7df618

  create_table "basket_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "item_id"
    t.integer  "basket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baskets", force: :cascade do |t|
    t.date     "checkout_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
<<<<<<< HEAD
    t.integer  "category_id"
    t.string   "barcode"
    t.string   "name"
    t.string   "gender"
    t.string   "age"
    t.integer  "quantity"
    t.string   "notes"
    t.boolean  "donated"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "date"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "program_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
    t.string   "barcode"
    t.integer  "quantity"
    t.string   "name"
    t.integer  "gender"
    t.integer  "age"
    t.text     "notes"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "donated"
>>>>>>> de33097513c436ed2c6cffe448fc3ff9cb7df618
  end

end
