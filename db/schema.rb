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

ActiveRecord::Schema[8.0].define(version: 2025_09_28_190734) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bmr_calculation_histories", force: :cascade do |t|
    t.string "formula"
    t.decimal "result", precision: 12, scale: 3
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_bmr_calculation_histories_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.date "birthday"
    t.string "gender"
    t.integer "height"
    t.decimal "weight", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name", "middle_name", "birthday"], name: "index_patients_on_name_and_birthday", unique: true
  end

  create_table "patients_doctors", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_patients_doctors_on_doctor_id"
    t.index ["patient_id"], name: "index_patients_doctors_on_patient_id"
  end

  add_foreign_key "bmr_calculation_histories", "patients"
  add_foreign_key "patients_doctors", "doctors"
  add_foreign_key "patients_doctors", "patients"
end
