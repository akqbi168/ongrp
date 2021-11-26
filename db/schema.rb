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

ActiveRecord::Schema.define(version: 2021_11_26_054702) do

  create_table "cases", force: :cascade do |t|
    t.date "date"
    t.integer "report_id"
    t.integer "staff_id", null: false
    t.integer "point", null: false
    t.integer "timeframe", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "staff_id"
    t.date "date", null: false
    t.time "time_start"
    t.time "time_end"
    t.integer "time_break"
    t.integer "store_id"
    t.integer "rank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.date "date", null: false
    t.integer "rank", null: false
    t.integer "daily_result", default: 0, null: false
    t.integer "working_hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.date "date"
    t.integer "target"
    t.integer "store_id", null: false
    t.integer "user_id", null: false
    t.boolean "is_submitted", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "comment"
    t.integer "action_approached"
    t.integer "action_discussed"
    t.integer "done_purchased"
    t.integer "done_downloaded_only"
    t.integer "done_discussed_only"
    t.integer "done_promotion"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name", null: false
    t.string "memo"
    t.integer "rank", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
