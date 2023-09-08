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

ActiveRecord::Schema[7.0].define(version: 2023_09_08_154539) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.string "description", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_offers_on_description", unique: true
  end

  create_table "targets", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.integer "min_age", null: false
    t.integer "max_age", null: false
    t.string "genders", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id", "min_age", "max_age", "genders"], name: "index_targets_on_offer_id_and_min_age_and_max_age_and_genders", unique: true
    t.index ["offer_id"], name: "index_targets_on_offer_id"
  end

  create_table "user_offers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_user_offers_on_offer_id"
    t.index ["user_id", "offer_id"], name: "index_user_offers_on_user_id_and_offer_id", unique: true
    t.index ["user_id"], name: "index_user_offers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.date "birthdate", null: false
    t.string "gender", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "targets", "offers"
  add_foreign_key "user_offers", "offers"
  add_foreign_key "user_offers", "users"
end
