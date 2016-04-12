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

ActiveRecord::Schema.define(version: 20160410183621) do

  create_table "accounts", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.integer  "level"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "followship_id"
  end

  add_index "accounts", ["followship_id"], name: "index_accounts_on_followship_id"

  create_table "followships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "followships", ["user_id"], name: "index_followships_on_user_id"

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.string   "description"
    t.integer  "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "link_id"
    t.integer  "user_id"
  end

  add_index "ratings", ["link_id"], name: "index_ratings_on_link_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

end
