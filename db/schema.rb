# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_11_30_160048) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flights", force: :cascade do |t|
    t.integer "trip_id"
    t.string "direction"
    t.string "total_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "layovers", force: :cascade do |t|
    t.integer "flight_id"
    t.string "duration"
    t.string "airport_id"
    t.string "airport_name"
    t.string "airport_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legs", force: :cascade do |t|
    t.integer "flight_id"
    t.string "airline"
    t.string "airline_logo"
    t.string "airplane"
    t.string "departure_airport_id"
    t.string "departure_airport_name"
    t.string "departure_airport_time"
    t.string "departure_airport_city"
    t.string "arrival_airport_id"
    t.string "arrival_airport_name"
    t.string "arrival_airport_time"
    t.string "arrival_airport_city"
    t.string "duration"
    t.string "flight_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leg_number"
    t.string "departure_day"
    t.string "arrival_day"
  end

  create_table "places", force: :cascade do |t|
    t.integer "trip_id"
    t.string "address"
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lat"
    t.float "lng"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "image_url"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "flight_booked", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
