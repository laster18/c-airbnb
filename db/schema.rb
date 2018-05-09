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

ActiveRecord::Schema.define(version: 20180509103932) do

  create_table "currencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_bathrooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number",                         null: false
    t.boolean  "only_for_guest", default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
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

  create_table "room_deadlines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "date",       null: false
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

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_type"
    t.integer  "person_capacity"
    t.text     "address",               limit: 65535
    t.boolean  "only_for_guest",                      default: false
    t.integer  "bedroom_number"
    t.integer  "bed_number"
    t.string   "check_in_from"
    t.string   "check_in_to"
    t.integer  "min_lodging"
    t.integer  "max_lodging"
    t.integer  "day_fee"
    t.integer  "experience"
    t.integer  "frequency"
    t.boolean  "child_permission",                    default: false
    t.text     "child_not_reason",      limit: 65535
    t.boolean  "infant_permission",                   default: false
    t.text     "infant_not_reason",     limit: 65535
    t.boolean  "pet_permission",                      default: false
    t.boolean  "party_permission",                    default: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "room_category_id"
    t.integer  "room_building_type_id"
    t.integer  "room_bathroom_id"
    t.integer  "room_deadline_id"
    t.integer  "currency_id"
    t.index ["currency_id"], name: "index_rooms_on_currency_id", using: :btree
    t.index ["room_bathroom_id"], name: "index_rooms_on_room_bathroom_id", using: :btree
    t.index ["room_building_type_id"], name: "index_rooms_on_room_building_type_id", using: :btree
    t.index ["room_category_id"], name: "index_rooms_on_room_category_id", using: :btree
    t.index ["room_deadline_id"], name: "index_rooms_on_room_deadline_id", using: :btree
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
    t.string   "gender"
    t.string   "native_currency"
    t.string   "preferred_locale"
    t.integer  "tel_number"
    t.text     "about",                  limit: 65535
    t.string   "current_city"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "room_calendars", "rooms"
  add_foreign_key "room_images", "rooms"
  add_foreign_key "rooms", "currencies"
  add_foreign_key "rooms", "room_bathrooms"
  add_foreign_key "rooms", "room_building_types"
  add_foreign_key "rooms", "room_categories"
  add_foreign_key "rooms", "room_deadlines"
end
