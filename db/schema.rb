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

ActiveRecord::Schema[7.1].define(version: 2023_11_29_133130) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_chat_rooms_on_itinerary_id"
  end

  create_table "excursions", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.string "city"
    t.integer "capacity"
    t.integer "length"
    t.text "description"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "average_rating"
    t.index ["user_id"], name: "index_excursions_on_user_id"
  end

  create_table "excursions_itineraries", id: false, force: :cascade do |t|
    t.bigint "excursion_id", null: false
    t.bigint "itinerary_id", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.date "start_time"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "excursion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_time"
    t.string "title"
    t.index ["excursion_id"], name: "index_itineraries_on_excursion_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "itinerary_excursions", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.bigint "excursion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excursion_id"], name: "index_itinerary_excursions_on_excursion_id"
    t.index ["itinerary_id"], name: "index_itinerary_excursions_on_itinerary_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "itinerary_id", null: false
    t.integer "rsvp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_participants_on_itinerary_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "excursion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_rating"
    t.index ["excursion_id"], name: "index_reviews_on_excursion_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "excursion_id", null: false
    t.boolean "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excursion_id"], name: "index_votes_on_excursion_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "chat_rooms", "itineraries"
  add_foreign_key "excursions", "users"
  add_foreign_key "itineraries", "excursions"
  add_foreign_key "itineraries", "users"
  add_foreign_key "itinerary_excursions", "excursions"
  add_foreign_key "itinerary_excursions", "itineraries"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "participants", "itineraries"
  add_foreign_key "participants", "users"
  add_foreign_key "reviews", "excursions"
  add_foreign_key "reviews", "users"
  add_foreign_key "votes", "excursions"
  add_foreign_key "votes", "users"
end
