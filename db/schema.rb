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

ActiveRecord::Schema.define(version: 20170101133840) do

  create_table "ad_cases", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "enterprise_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_active",     default: true
    t.integer  "case_amount",   default: 0
  end

  create_table "enterprises", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "location_mrt_lineships", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "mrt_line_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_location_mrt_lineships_on_location_id"
    t.index ["mrt_line_id"], name: "index_location_mrt_lineships_on_mrt_line_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "station"
    t.integer  "exit_number"
    t.integer  "longitude"
    t.integer  "latitude"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "station_number1"
    t.string   "station_number2"
    t.integer  "umbrella_count",  default: 0
    t.index ["station"], name: "index_locations_on_station"
  end

  create_table "mrt_lines", force: :cascade do |t|
    t.integer  "line_code"
    t.string   "line_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rent_histories", force: :cascade do |t|
    t.integer  "umbrella_id"
    t.integer  "user_id"
    t.integer  "start_location_id"
    t.datetime "start_time"
    t.integer  "end_location_id"
    t.datetime "end_time"
    t.integer  "amount",            default: 0,     null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "is_returned",       default: false
    t.index ["umbrella_id"], name: "index_rent_histories_on_umbrella_id"
    t.index ["user_id"], name: "index_rent_histories_on_user_id"
  end

  create_table "umbrellas", force: :cascade do |t|
    t.integer  "umbrella_holder_id",   default: 1
    t.string   "umbrella_holder_type", default: "Location"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "description"
    t.integer  "rent_count",           default: 0
    t.string   "umbrella_number"
    t.integer  "ad_case_id"
    t.index ["umbrella_holder_id", "umbrella_holder_type"], name: "index_umbrellas_on_umbrella_holder_id_and_umbrella_holder_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
