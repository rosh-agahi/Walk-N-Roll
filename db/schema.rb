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

ActiveRecord::Schema.define(version: 2021_06_06_001126) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "apptdate"
    t.string "service"
    t.integer "dog_id"
    t.integer "dogwalker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_appointments_on_dog_id"
    t.index ["dogwalker_id"], name: "index_appointments_on_dogwalker_id"
  end

  create_table "business_owners", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "business_join_code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.integer "phonenumber"
    t.string "address"
    t.integer "business_owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_owner_id"], name: "index_clients_on_business_owner_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "age"
    t.string "favorite_treat"
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_dogs_on_client_id"
  end

  create_table "dogwalkers", force: :cascade do |t|
    t.integer "name"
    t.integer "business_owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_owner_id"], name: "index_dogwalkers_on_business_owner_id"
  end

  add_foreign_key "appointments", "dogs"
  add_foreign_key "appointments", "dogwalkers"
  add_foreign_key "clients", "business_owners"
  add_foreign_key "dogs", "clients"
  add_foreign_key "dogwalkers", "business_owners"
end
