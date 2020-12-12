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

ActiveRecord::Schema.define(version: 2020_12_12_065941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drones", force: :cascade do |t|
    t.string "name"
    t.string "colour"
    t.string "status", default: "off"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engines", force: :cascade do |t|
    t.string "name"
    t.integer "power_indicator"
    t.string "status", default: "off"
    t.bigint "drone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_engines_on_drone_id"
  end

  create_table "gyroscopes", force: :cascade do |t|
    t.string "name"
    t.integer "x", default: 0
    t.integer "y", default: 0
    t.integer "z", default: 0
    t.bigint "drone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_gyroscopes_on_drone_id"
  end

  create_table "orientation_sensors", force: :cascade do |t|
    t.string "name"
    t.string "pitch"
    t.string "roll"
    t.bigint "drone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_orientation_sensors_on_drone_id"
  end

  add_foreign_key "engines", "drones"
  add_foreign_key "gyroscopes", "drones"
  add_foreign_key "orientation_sensors", "drones"
end
