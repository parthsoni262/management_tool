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

ActiveRecord::Schema.define(version: 2021_01_28_072432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "m_companies", force: :cascade do |t|
    t.bigint "company_cd"
    t.string "company_name"
    t.string "address1"
    t.string "address2"
    t.string "email_id", null: false
    t.string "contact_no", null: false
    t.boolean "del_flag", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "m_genders", force: :cascade do |t|
    t.integer "gender_cd"
    t.string "gender_name", null: false
    t.boolean "del_flag", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "m_roles", force: :cascade do |t|
    t.string "role_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "m_users", force: :cascade do |t|
    t.integer "user_id"
    t.string "mail_id", null: false
    t.string "password", null: false
    t.bigint "m_companies_id", default: 1, null: false
    t.boolean "del_flag", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["m_companies_id"], name: "index_m_users_on_m_companies_id"
    t.index ["user_id"], name: "index_m_users_on_user_id", unique: true
  end

  create_table "t_user_masters", force: :cascade do |t|
    t.bigint "m_users_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "m_genders_id", null: false
    t.string "contact_no", null: false
    t.bigint "parents_contact_no"
    t.string "address"
    t.binary "zairyo_card"
    t.datetime "zairyo_card_expire_date"
    t.binary "adhar_card", null: false
    t.binary "passport", null: false
    t.datetime "passport_expire_date"
    t.bigint "my_number", null: false
    t.bigint "m_roles_id"
    t.string "user_name"
    t.boolean "del_flag", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["m_genders_id"], name: "index_t_user_masters_on_m_genders_id"
    t.index ["m_roles_id"], name: "index_t_user_masters_on_m_roles_id"
    t.index ["m_users_id"], name: "index_t_user_masters_on_m_users_id"
  end

  add_foreign_key "m_users", "m_companies", column: "m_companies_id"
  add_foreign_key "t_user_masters", "m_genders", column: "m_genders_id"
  add_foreign_key "t_user_masters", "m_roles", column: "m_roles_id"
  add_foreign_key "t_user_masters", "m_users", column: "m_users_id"
end
