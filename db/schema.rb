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

ActiveRecord::Schema.define(version: 20140716002742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessors", force: true do |t|
    t.string   "name"
    t.text     "api_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "battles", force: true do |t|
    t.integer  "war_id"
    t.integer  "winner_id"
    t.integer  "user_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "battles", ["user_id"], name: "index_battles_on_user_id", using: :btree
  add_index "battles", ["war_id"], name: "index_battles_on_war_id", using: :btree
  add_index "battles", ["winner_id"], name: "index_battles_on_winner_id", using: :btree

  create_table "participants", force: true do |t|
    t.integer  "user_id"
    t.integer  "war_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "war_id"
    t.integer  "tally"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_disabled"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "users_wars", id: false, force: true do |t|
    t.integer "user_id"
  end

  create_table "wars", force: true do |t|
    t.string   "name"
    t.boolean  "has_end"
    t.datetime "ending_date"
    t.integer  "ending_score"
    t.string   "prize"
    t.boolean  "is_private"
    t.boolean  "open_registration"
    t.boolean  "is_complete"
    t.integer  "winner_id"
    t.integer  "owner_id"
    t.boolean  "is_disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wars", ["name"], name: "index_wars_on_name", using: :btree
  add_index "wars", ["owner_id"], name: "index_wars_on_owner_id", using: :btree

end
