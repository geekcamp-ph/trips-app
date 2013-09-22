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

ActiveRecord::Schema.define(version: 20130922095829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: true do |t|
    t.decimal  "budget",    precision: 10, scale: 2, default: 0.0
    t.decimal  "decimal",   precision: 10, scale: 2, default: 0.0
    t.datetime "date_from",                                        null: false
    t.datetime "date_to",                                          null: false
  end

  create_table "itineraries", force: true do |t|
    t.string  "location",                                              null: false
    t.date    "travel_on",                                             null: false
    t.decimal "estimated_cost", precision: 10, scale: 2, default: 0.0
    t.integer "trip_id",                                               null: false
  end

  create_table "trips", force: true do |t|
    t.string "name", null: false
  end

end
