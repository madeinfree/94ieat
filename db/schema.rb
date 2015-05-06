# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150506055626) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "qty",        limit: 4, default: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locals", force: :cascade do |t|
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "address",    limit: 255
    t.text     "desc",       limit: 65535
    t.string   "title",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "order_infos", force: :cascade do |t|
    t.string   "shipping_name",    limit: 255
    t.string   "string",           limit: 255
    t.string   "shipping_address", limit: 255
    t.string   "lineid",           limit: 255
    t.string   "company",          limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "order_id",         limit: 4
  end

  add_index "order_infos", ["order_id"], name: "index_order_infos_on_order_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",     limit: 4
    t.string   "product_name", limit: 255
    t.float    "price",        limit: 24
    t.integer  "qty",          limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "user_id",        limit: 255
    t.integer  "total",          limit: 4,   default: 0
    t.boolean  "paid",           limit: 1,   default: false
    t.string   "payment_method", limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "store_id",   limit: 255
    t.string   "name",       limit: 255
    t.integer  "price",      limit: 4
    t.integer  "hito",       limit: 4
    t.integer  "qty",        limit: 4,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "gacode",     limit: 65535
    t.text     "seo",        limit: 65535
    t.string   "keyword",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "store_categories", force: :cascade do |t|
    t.integer  "store_id",   limit: 4
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "order_status", limit: 255
    t.string   "status",       limit: 255,   default: "0"
    t.string   "name",         limit: 255
    t.string   "st_type",      limit: 255
    t.string   "pd_type",      limit: 255
    t.string   "address",      limit: 255
    t.string   "tel",          limit: 255
    t.text     "desc",         limit: 65535
    t.integer  "max_qty",      limit: 4,     default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean  "admin",                  limit: 1,   default: false, null: false
    t.boolean  "store",                  limit: 1,   default: false, null: false
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
