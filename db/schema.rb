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

ActiveRecord::Schema.define(version: 2019_05_03_095317) do

  create_table "foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "image"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_ordered", default: 0
    t.index ["restaurant_id", "created_at"], name: "index_foods_on_restaurant_id_and_created_at"
    t.index ["restaurant_id"], name: "index_foods_on_restaurant_id"
  end

  create_table "ratings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "quality_point"
    t.float "service_point"
    t.float "location_point"
    t.float "space_point"
    t.float "price_point"
    t.bigint "user_id"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_ratings_on_restaurant_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "restaurants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "total_ratings"
    t.float "ratings"
    t.integer "minprice"
    t.integer "maxprice"
    t.string "open_time"
    t.string "close_time"
    t.integer "total_reviews"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.float "quality_point", default: 0.0
    t.float "price_point", default: 0.0
    t.float "service_point", default: 0.0
    t.float "space_point", default: 0.0
    t.float "location_point", default: 0.0
    t.integer "number_of_commented", default: 0
    t.integer "number_of_shared", default: 0
    t.integer "number_of_rated", default: 0
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
  end

  add_foreign_key "foods", "restaurants"
  add_foreign_key "ratings", "restaurants"
  add_foreign_key "ratings", "users"
end
