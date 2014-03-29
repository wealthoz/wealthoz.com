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

ActiveRecord::Schema.define(version: 20140328053535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.integer  "report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["name"], name: "index_accounts_on_name", using: :btree

  create_table "fs", force: true do |t|
    t.string   "report"
    t.string   "report_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fs", ["report", "report_class"], name: "index_fs_on_report_and_report_class", using: :btree

  create_table "fxes", force: true do |t|
    t.string   "country"
    t.string   "fx"
    t.decimal  "usd_to"
    t.decimal  "to_usd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fxes", ["fx"], name: "index_fxes_on_fx", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fx_id"
  end

  add_index "groups", ["name"], name: "index_groups_on_name", using: :btree

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "percent_owned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["name", "group_id"], name: "index_projects_on_name_and_group_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.integer  "group_id",        default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
