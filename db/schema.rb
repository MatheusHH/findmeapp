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

ActiveRecord::Schema.define(version: 2019_11_22_194542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "cep"
    t.string "street"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "email"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "ads", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.string "contact"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_ads_on_category_id"
    t.index ["user_id"], name: "index_ads_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.text "description"
    t.integer "status", default: 0
    t.bigint "user_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "schedule"
    t.index ["customer_id"], name: "index_books_on_customer_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "budget_services", force: :cascade do |t|
    t.bigint "budget_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_budget_services_on_budget_id"
    t.index ["service_id"], name: "index_budget_services_on_service_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.bigint "customer_id"
    t.date "duedate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "totalprice_cents", default: 0, null: false
    t.string "totalprice_currency", default: "BRL", null: false
    t.integer "discount_cents", default: 0, null: false
    t.string "discount_currency", default: "BRL", null: false
    t.bigint "user_id"
    t.index ["customer_id"], name: "index_budgets_on_customer_id"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "campaign_customers", force: :cascade do |t|
    t.bigint "campaign_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_customers_on_campaign_id"
    t.index ["customer_id"], name: "index_campaign_customers_on_customer_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_phones_on_customer_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "BRL", null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "customers_count", default: 0
    t.integer "counter_of_books", default: 0
    t.integer "counter_of_services", default: 0
    t.integer "counter_of_ads", default: 0
    t.integer "counter_of_budgets", default: 0
    t.integer "counter_of_campaigns", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "customers"
  add_foreign_key "ads", "categories"
  add_foreign_key "ads", "users"
  add_foreign_key "books", "customers"
  add_foreign_key "books", "users"
  add_foreign_key "budget_services", "budgets"
  add_foreign_key "budget_services", "services"
  add_foreign_key "budgets", "customers"
  add_foreign_key "budgets", "users"
  add_foreign_key "campaign_customers", "campaigns"
  add_foreign_key "campaign_customers", "customers"
  add_foreign_key "campaigns", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "customers", "users"
  add_foreign_key "phones", "customers"
  add_foreign_key "services", "users"
end
