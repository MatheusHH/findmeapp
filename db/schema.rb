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

ActiveRecord::Schema.define(version: 2019_11_17_224708) do

  create_table "addresses", force: :cascade do |t|
    t.string "cep"
    t.string "street"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "email"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "ads", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.string "contact"
    t.integer "category_id"
    t.index ["category_id"], name: "index_ads_on_category_id"
    t.index ["user_id"], name: "index_ads_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.text "description"
    t.integer "status", default: 0
    t.integer "user_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "schedule"
    t.index ["customer_id"], name: "index_books_on_customer_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "budget_services", force: :cascade do |t|
    t.integer "budget_id"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_budget_services_on_budget_id"
    t.index ["service_id"], name: "index_budget_services_on_service_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "customer_id"
    t.date "duedate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "totalprice_cents", default: 0, null: false
    t.string "totalprice_currency", default: "BRL", null: false
    t.integer "discount_cents", default: 0, null: false
    t.string "discount_currency", default: "BRL", null: false
    t.integer "user_id"
    t.index ["customer_id"], name: "index_budgets_on_customer_id"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "campaign_customers", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "customer_id"
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
    t.integer "user_id"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_phones_on_customer_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
