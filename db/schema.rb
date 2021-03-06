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

ActiveRecord::Schema.define(version: 20180525015123) do

  create_table "amenities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",                   null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "available_spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_folders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                   null: false
    t.string   "name",                      null: false
    t.boolean  "release",    default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_favorite_folders_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id",            null: false
    t.integer  "favorite_folder_id", null: false
    t.integer  "user_id",            null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["favorite_folder_id"], name: "index_favorites_on_favorite_folder_id", using: :btree
    t.index ["room_id"], name: "index_favorites_on_room_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "house_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "child_permission",                default: false
    t.text     "child_not_reason",  limit: 65535
    t.boolean  "infant_permission",               default: false
    t.text     "infant_not_reason", limit: 65535
    t.boolean  "pet_permission",                  default: false
    t.boolean  "party_permission",                default: false
    t.integer  "room_id",                                         null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["room_id"], name: "index_house_rules_on_room_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "message",         limit: 65535,             null: false
    t.integer  "send_user_id",                              null: false
    t.integer  "receive_user_id",                           null: false
    t.integer  "kind",                          default: 0, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "notice_descriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_amenities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id",    null: false
    t.integer  "amenity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_room_amenities_on_amenity_id", using: :btree
    t.index ["room_id", "amenity_id"], name: "index_room_amenities_on_room_id_and_amenity_id", using: :btree
    t.index ["room_id"], name: "index_room_amenities_on_room_id", using: :btree
  end

  create_table "room_appointments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id",                                    null: false
    t.integer  "user_id",                                    null: false
    t.date     "check_in_date",                              null: false
    t.date     "check_out_date",                             null: false
    t.integer  "number_of_adult",                default: 1, null: false
    t.integer  "number_of_child",                default: 0, null: false
    t.integer  "number_of_infant",               default: 0, null: false
    t.text     "message",          limit: 65535,             null: false
    t.integer  "total_fee",                                  null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["room_id"], name: "index_room_appointments_on_room_id", using: :btree
    t.index ["user_id"], name: "index_room_appointments_on_user_id", using: :btree
  end

  create_table "room_available_spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id",            null: false
    t.integer  "available_space_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["available_space_id"], name: "index_room_available_spaces_on_available_space_id", using: :btree
    t.index ["room_id"], name: "index_room_available_spaces_on_room_id", using: :btree
  end

  create_table "room_building_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_calendars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "date",       null: false
    t.integer  "room_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_calendars_on_room_id", using: :btree
  end

  create_table "room_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image",      null: false
    t.integer  "room_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_images_on_room_id", using: :btree
  end

  create_table "room_notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id",               null: false
    t.integer  "notice_id",             null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "notice_description_id"
    t.index ["notice_description_id"], name: "index_room_notices_on_notice_description_id", using: :btree
    t.index ["notice_id"], name: "index_room_notices_on_notice_id", using: :btree
    t.index ["room_id"], name: "index_room_notices_on_room_id", using: :btree
  end

  create_table "room_recommendations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id",           null: false
    t.integer  "recommendation_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["recommendation_id"], name: "index_room_recommendations_on_recommendation_id", using: :btree
    t.index ["room_id"], name: "index_room_recommendations_on_room_id", using: :btree
  end

  create_table "room_requirements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id",        null: false
    t.integer  "requirement_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["requirement_id"], name: "index_room_requirements_on_requirement_id", using: :btree
    t.index ["room_id"], name: "index_room_requirements_on_room_id", using: :btree
  end

  create_table "room_safety_amenities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id",           null: false
    t.integer  "safety_amenity_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["room_id", "safety_amenity_id"], name: "index_room_safety_amenities_on_room_id_and_safety_amenity_id", using: :btree
    t.index ["room_id"], name: "index_room_safety_amenities_on_room_id", using: :btree
    t.index ["safety_amenity_id"], name: "index_room_safety_amenities_on_safety_amenity_id", using: :btree
  end

  create_table "room_shared_spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_id",         null: false
    t.integer  "shared_space_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["room_id"], name: "index_room_shared_spaces_on_room_id", using: :btree
    t.index ["shared_space_id"], name: "index_room_shared_spaces_on_shared_space_id", using: :btree
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_type"
    t.integer  "person_capacity"
    t.boolean  "only_for_guest",                      default: false
    t.integer  "bedroom_number"
    t.integer  "bed_number"
    t.integer  "bathroom_number"
    t.string   "check_in_from"
    t.string   "check_in_to"
    t.integer  "min_lodging"
    t.integer  "max_lodging"
    t.integer  "day_fee_cents",                       default: 0
    t.string   "experience"
    t.string   "frequency"
    t.string   "title"
    t.text     "overview",              limit: 65535
    t.integer  "country"
    t.integer  "zipcode"
    t.text     "state",                 limit: 65535
    t.text     "city",                  limit: 65535
    t.text     "street",                limit: 65535
    t.text     "apartment",             limit: 65535
    t.string   "currency"
    t.string   "deadline"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "room_category_id"
    t.integer  "room_building_type_id"
    t.integer  "user_id",                                             null: false
    t.index ["room_building_type_id"], name: "index_rooms_on_room_building_type_id", using: :btree
    t.index ["room_category_id"], name: "index_rooms_on_room_category_id", using: :btree
    t.index ["user_id"], name: "index_rooms_on_user_id", using: :btree
  end

  create_table "safety_amenities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",                   null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "shared_spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "first_name",                                        null: false
    t.string   "last_name",                                         null: false
    t.integer  "birthday_month",                                    null: false
    t.integer  "birthday_day",                                      null: false
    t.integer  "birthday_year",                                     null: false
    t.integer  "gender",                               default: 2
    t.string   "native_currency"
    t.string   "preferred_locale"
    t.integer  "tel_number"
    t.text     "about",                  limit: 65535
    t.string   "current_city"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "favorite_folders", "users"
  add_foreign_key "favorites", "favorite_folders"
  add_foreign_key "favorites", "rooms"
  add_foreign_key "favorites", "users"
  add_foreign_key "house_rules", "rooms"
  add_foreign_key "room_amenities", "amenities"
  add_foreign_key "room_amenities", "rooms"
  add_foreign_key "room_appointments", "rooms"
  add_foreign_key "room_appointments", "users"
  add_foreign_key "room_available_spaces", "available_spaces"
  add_foreign_key "room_available_spaces", "rooms"
  add_foreign_key "room_calendars", "rooms"
  add_foreign_key "room_images", "rooms"
  add_foreign_key "room_notices", "notice_descriptions"
  add_foreign_key "room_notices", "notices"
  add_foreign_key "room_notices", "rooms"
  add_foreign_key "room_recommendations", "recommendations"
  add_foreign_key "room_recommendations", "rooms"
  add_foreign_key "room_requirements", "requirements"
  add_foreign_key "room_requirements", "rooms"
  add_foreign_key "room_safety_amenities", "rooms"
  add_foreign_key "room_safety_amenities", "safety_amenities"
  add_foreign_key "room_shared_spaces", "rooms"
  add_foreign_key "room_shared_spaces", "shared_spaces"
  add_foreign_key "rooms", "room_building_types"
  add_foreign_key "rooms", "room_categories"
  add_foreign_key "rooms", "users"
end
