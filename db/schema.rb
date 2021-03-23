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

ActiveRecord::Schema.define(version: 2021_03_23_090625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "time_cards", force: :cascade do |t|
    t.integer "year", limit: 2, null: false
    t.integer "month", limit: 2, null: false
    t.integer "day", limit: 2, null: false
    t.datetime "in_at"
    t.datetime "out_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_results", force: :cascade do |t|
    t.integer "writing"
    t.integer "revision"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "time_card_id", null: false
    t.index ["time_card_id"], name: "index_work_results_on_time_card_id"
  end

  add_foreign_key "work_results", "time_cards"
end
