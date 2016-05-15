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

ActiveRecord::Schema.define(version: 20160422211954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "smoker_stats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "amount",     null: false
    t.string   "date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swim_stats", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "date"
    t.string   "warm_50"
    t.string   "warm_100"
    t.string   "warm_200"
    t.string   "warm_400"
    t.string   "pre_50"
    t.string   "first_500"
    t.string   "second_500"
    t.string   "third_500"
    t.string   "fourth_500"
    t.string   "set_100"
    t.string   "post_50"
    t.string   "cool_400"
    t.string   "cool_200"
    t.string   "cool_100"
    t.string   "cool_50"
    t.integer  "set_distance"
    t.string   "set_time"
    t.string   "first_800_time"
    t.string   "second_800_time"
    t.string   "first_km_time"
    t.string   "second_km_time"
    t.string   "time_1500"
    t.string   "mile_time"
    t.integer  "total_distance"
    t.string   "swim_time"
    t.string   "total_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
