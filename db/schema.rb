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

ActiveRecord::Schema.define(version: 20140122034816) do

  create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.integer  "workout_id"
    t.integer  "number"
    t.string   "metric"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_range"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "name"
    t.text     "achievements"
    t.string   "time_zone"
    t.integer  "current_workout_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "workout_records", force: true do |t|
    t.integer  "user_id"
    t.integer  "workout_id"
    t.integer  "duration"
    t.integer  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workout_records", ["user_id"], name: "index_workout_records_on_user_id"
  add_index "workout_records", ["workout_id"], name: "index_workout_records_on_workout_id"

  create_table "workouts", force: true do |t|
    t.string   "name"
    t.integer  "distance"
    t.integer  "duration"
    t.integer  "reps"
    t.text     "notes"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

end
