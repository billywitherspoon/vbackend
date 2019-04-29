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

ActiveRecord::Schema.define(version: 2019_04_27_203824) do

  create_table "logs", force: :cascade do |t|
    t.integer "mileage"
    t.string "title"
    t.text "description"
    t.text "note"
    t.boolean "complete"
    t.date "date_due"
    t.date "date_completed"
    t.integer "difficulty"
    t.integer "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "username"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vin"
    t.string "plate"
    t.string "model_year"
    t.string "make"
    t.string "model"
    t.string "trim"
    t.string "displacement_l"
    t.string "engine_configuration"
    t.string "engine_model"
    t.string "drive"
    t.string "engine_number_of_cylinders"
    t.string "fuel_type"
    t.string "manufacturer_name"
    t.string "plant_city"
    t.string "plant_country"
    t.string "engine_brake_hp"
    t.string "tpms"
    t.string "name"
    t.string "color"
    t.string "auto_image"
    t.string "user_image"
    t.string "tire_size_front"
    t.string "tire_size_rear"
    t.string "wheel_size_front_inches"
    t.string "wheel_size_rear_inches"
    t.integer "user_id"
    t.string "series"
    t.string "body_class"
    t.string "trim2"
    t.string "doors"
    t.string "gross_vehicle_weight_rating"
    t.string "engine_manufacturer"
    t.string "turbo"
    t.string "brake_system_type"
    t.string "top_speed_mph"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plant_state"
  end

end
