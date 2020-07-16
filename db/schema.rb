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

ActiveRecord::Schema.define(version: 2020_07_16_155946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_transactions", force: :cascade do |t|
    t.bigint "nonprofit_id", null: false
    t.decimal "amount", precision: 19, scale: 4
    t.integer "status"
    t.datetime "initiated_at"
    t.datetime "sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nonprofit_id"], name: "index_check_transactions_on_nonprofit_id"
  end

  create_table "donations", force: :cascade do |t|
    t.decimal "amount", precision: 19, scale: 4
    t.datetime "initiated_at"
    t.datetime "processed_at"
    t.bigint "nonprofit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nonprofit_id"], name: "index_donations_on_nonprofit_id"
  end

  create_table "nonprofits", force: :cascade do |t|
    t.string "name"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "check_transactions", "nonprofits"
  add_foreign_key "donations", "nonprofits"
end
