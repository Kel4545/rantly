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

ActiveRecord::Schema.define(version: 20141016212730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text    "comment"
    t.integer "user_id"
    t.integer "rant_id"
  end

  create_table "favorites", force: true do |t|
    t.integer "rant_id"
    t.integer "user_id"
  end

  create_table "follows", force: true do |t|
    t.integer "follower_id"
    t.integer "followee_id"
  end

  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id", using: :btree

  create_table "rants", force: true do |t|
    t.string   "about"
    t.text     "rant"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "favorites_count", default: 0
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "bio"
    t.string   "password_digest"
    t.string   "frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
