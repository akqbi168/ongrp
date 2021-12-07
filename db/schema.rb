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

ActiveRecord::Schema.define(version: 2021_12_07_061236) do

  create_table "bounties", force: :cascade do |t|
    t.integer "staff_c", null: false
    t.integer "staff_b", null: false
    t.integer "staff_a", null: false
    t.integer "lead_b", null: false
    t.integer "lead_a", null: false
    t.integer "director", null: false
    t.float "ratio", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cases", force: :cascade do |t|
    t.integer "report_id", null: false
    t.integer "staff_id", null: false
    t.float "point", null: false
    t.integer "timeframe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "memo"
    t.boolean "confirmed_by_client"
    t.string "comment_by_client"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.date "date", null: false
    t.integer "rank_id", null: false
    t.integer "store_id"
    t.time "time_start", null: false
    t.time "time_end", null: false
    t.integer "time_break"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.date "date", null: false
    t.integer "staff_id", null: false
    t.integer "job_id"
    t.time "time_start"
    t.time "time_end"
    t.integer "time_break"
    t.float "working_hours"
    t.integer "per_hour"
    t.integer "report_id"
    t.float "indivisual_point"
    t.integer "bonus_base"
    t.float "store_point"
    t.float "bonus_ratio"
    t.integer "daily_payment"
    t.integer "adjuster", default: 0
    t.boolean "is_confirmed_on_wage", default: false
    t.boolean "is_confirmed_on_bonus", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "per_hour", null: false
    t.string "requirements"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.date "date", null: false
    t.integer "store_id", null: false
    t.integer "user_id", null: false
    t.integer "target"
    t.string "memo"
    t.integer "action_approached"
    t.integer "action_discussed"
    t.integer "action_purchased"
    t.integer "action_downloaded_only"
    t.integer "action_discussed_only"
    t.integer "action_promotion_done"
    t.integer "purchased_for_value"
    t.integer "purchased_for_wanted"
    t.integer "purchased_for_trial"
    t.integer "purchased_for_others"
    t.string "purchased_for_others_memo"
    t.integer "downloaded_only_for_no_time"
    t.integer "downloaded_only_for_no_cards"
    t.integer "downloaded_only_for_app_error"
    t.integer "downloaded_only_for_others"
    t.string "downloaded_only_for_others_memo"
    t.integer "discussed_only_for_no_time"
    t.integer "discussed_only_for_no_downloadable"
    t.integer "discussed_only_for_denying_cards"
    t.integer "discussed_only_for_no_demand"
    t.integer "discussed_only_for_app_error"
    t.integer "discussed_only_for_denying_app"
    t.integer "discussed_only_for_others"
    t.string "discussed_only_for_others_memo"
    t.integer "promotion_done_for_value1"
    t.integer "promotion_done_for_value2"
    t.integer "promotion_done_for_value3"
    t.integer "promotion_done_for_value4"
    t.integer "promotion_done_for_others"
    t.string "promotion_done_for_others_memo"
    t.boolean "is_submitted", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name", null: false
    t.string "memo"
    t.integer "rank_id", null: false
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
    t.integer "account_level", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
