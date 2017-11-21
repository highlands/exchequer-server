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

ActiveRecord::Schema.define(version: 20171121174119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "auth_token"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_token"], name: "index_api_keys_on_auth_token", unique: true
    t.index ["manager_id"], name: "index_api_keys_on_manager_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.bigint "offer_id"
    t.string "name"
    t.decimal "percent_off"
    t.decimal "amount_off"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_coupons_on_offer_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "offer_id"
    t.bigint "user_id"
    t.datetime "due_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_invoices_on_offer_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "invoice_id"
    t.integer "quantity"
    t.decimal "amount"
    t.bigint "offer_id"
    t.bigint "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_line_items_on_coupon_id"
    t.index ["invoice_id"], name: "index_line_items_on_invoice_id"
    t.index ["offer_id"], name: "index_line_items_on_offer_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "manager_id"
    t.string "description"
    t.string "name"
    t.datetime "due_on"
    t.decimal "amount"
    t.boolean "deferrable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_offers_on_manager_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payment_methods_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "invoice_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_payments_on_invoice_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.integer "household_id"
    t.string "token"
    t.string "secret"
    t.string "url"
    t.string "type"
    t.json "data"
    t.string "slug"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "api_keys", "managers"
  add_foreign_key "coupons", "offers"
  add_foreign_key "invoices", "offers"
  add_foreign_key "invoices", "users"
  add_foreign_key "line_items", "coupons"
  add_foreign_key "line_items", "invoices"
  add_foreign_key "line_items", "offers"
  add_foreign_key "offers", "managers"
  add_foreign_key "payment_methods", "users"
  add_foreign_key "payments", "invoices"
end
