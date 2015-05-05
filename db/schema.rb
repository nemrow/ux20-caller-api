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

ActiveRecord::Schema.define(version: 20150504031414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "places", force: :cascade do |t|
    t.string   "response"
    t.string   "place_id"
    t.string   "phone_number"
    t.boolean  "complete",     default: false
    t.integer  "search_id"
    t.string   "sha"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "places", ["sha"], name: "index_places_on_sha", using: :btree

  create_table "searches", force: :cascade do |t|
    t.string   "sha"
    t.string   "recording_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "searches", ["sha"], name: "index_searches_on_sha", using: :btree

end
