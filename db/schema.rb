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

ActiveRecord::Schema.define(version: 20140621222627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: true do |t|
    t.string   "time_preference"
    t.string   "tools"
    t.string   "type_of_work"
    t.string   "duration"
    t.boolean  "recurring"
    t.string   "location"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "resident"
    t.boolean  "volunteer"
    t.boolean  "corporation"
    t.string   "phone_number"
    t.boolean  "reference"
    t.string   "reference_contact"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "background_check"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
