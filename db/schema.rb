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

ActiveRecord::Schema.define(version: 20160226222838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "number"
    t.string   "accounttype"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
  end

  create_table "contractors", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "nip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decrees", force: :cascade do |t|
    t.float    "amount"
    t.integer  "evidence_id"
    t.integer  "account_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "decreetype"
  end

  add_index "decrees", ["account_id"], name: "index_decrees_on_account_id", using: :btree
  add_index "decrees", ["evidence_id"], name: "index_decrees_on_evidence_id", using: :btree

  create_table "evidences", force: :cascade do |t|
    t.string   "number"
    t.date     "madedate"
    t.float    "amount"
    t.string   "description"
    t.integer  "contractor_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "accept",        default: false
  end

  add_index "evidences", ["contractor_id"], name: "index_evidences_on_contractor_id", using: :btree

  add_foreign_key "decrees", "accounts"
  add_foreign_key "decrees", "evidences"
  add_foreign_key "evidences", "contractors"
end
