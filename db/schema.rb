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

ActiveRecord::Schema.define(version: 20151105174618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "base",       default: 1
    t.boolean  "stat_type"
    t.integer  "cost"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "untrained",       default: 50
    t.integer  "trained",         default: 0
    t.integer  "spy",             default: 0
    t.integer  "total_gold",      default: 15000
    t.integer  "turns",           default: 15
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "attack_level",    default: 1
    t.integer  "defense_level",   default: 1
    t.integer  "spy_level",       default: 1
    t.integer  "unit_production", default: 1
    t.hstore   "attack_items"
    t.hstore   "defense_items"
  end

  add_index "users", ["attack_items"], name: "index_users_on_attack_items", using: :gin
  add_index "users", ["defense_items"], name: "index_users_on_defense_items", using: :gin

end
