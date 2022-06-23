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

ActiveRecord::Schema[7.0].define(version: 2022_06_23_155731) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.time "working_hours", default: [], array: true
    t.index ["address"], name: "index_companies_on_address", unique: true
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["latitude", "longitude"], name: "index_companies_on_latitude_and_longitude", unique: true
    t.index ["name"], name: "index_companies_on_name", unique: true
    t.index ["phone"], name: "index_companies_on_phone", unique: true
    t.index ["website"], name: "index_companies_on_website", unique: true
  end

  create_table "laboratory_sets", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.float "erythrocytes"
    t.float "hemoglobin"
    t.float "hematocrit"
    t.float "platelets"
    t.float "platelet"
    t.float "leukocytes"
    t.float "lymphocytes"
    t.float "lymphocytes_percents"
    t.float "monocytes"
    t.float "monocytes_percents"
    t.float "shoe"
    t.float "granulocytes"
    t.float "granulocytes_percents"
    t.float "yuni"
    t.float "reticulocytes_sticks"
    t.float "segments"
    t.float "eosinophils"
    t.float "basophils"
    t.float "reticulocytes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_laboratory_sets_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone"
    t.integer "blood_type"
    t.boolean "rhesus"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_patients_on_email"
    t.index ["name"], name: "index_patients_on_name"
    t.index ["phone"], name: "index_patients_on_phone"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.boolean "admin", default: false, null: false
    t.boolean "superadmin", default: false, null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["password_digest"], name: "index_users_on_password_digest"
  end

  add_foreign_key "laboratory_sets", "patients"
  add_foreign_key "patients", "users"
  add_foreign_key "users", "companies"
end
