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

ActiveRecord::Schema.define(version: 2019_10_31_075057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clock_events", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "event_type", limit: 2, comment: "1:school, 2:lunch, 3:personal"
    t.integer "event_action", limit: 2, comment: "1:clock_in, 2:clock_out"
    t.string "event_reason"
    t.datetime "event_time"
    t.string "created_by"
    t.string "updated_by"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["user_id"], name: "index_clock_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.integer "user_role", limit: 2, default: 2, comment: "1:admin, 2:user"
    t.string "created_by"
    t.string "updated_by"
    t.string "deleted_by"
    t.datetime "deleted_at"
  end

end
