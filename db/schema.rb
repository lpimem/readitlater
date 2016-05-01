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

ActiveRecord::Schema.define(version: 20160422201105) do

  create_table "accounts", force: :cascade do |t|
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
    t.integer  "level"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "link_id"
    t.integer  "account_id"
  end

  add_index "comments", ["account_id"], name: "index_comments_on_account_id"
  add_index "comments", ["link_id"], name: "index_comments_on_link_id"

# Could not dump table "followships" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.string   "description"
    t.integer  "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "account_id"
  end

  add_index "links", ["account_id"], name: "index_links_on_account_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "profiles", ["account_id"], name: "index_profiles_on_account_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "value",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "link_id"
    t.integer  "account_id"
  end

  add_index "ratings", ["account_id"], name: "index_ratings_on_account_id"
  add_index "ratings", ["link_id"], name: "index_ratings_on_link_id"

  create_table "reports", force: :cascade do |t|
    t.text     "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "link_id"
  end

  add_index "reports", ["link_id"], name: "index_reports_on_link_id"

end
