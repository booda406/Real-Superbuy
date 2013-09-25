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

ActiveRecord::Schema.define(version: 20130918071843) do

  create_table "orders", force: true do |t|
    t.string   "contact"
    t.float    "exchange_rate"
    t.float    "fare"
    t.float    "fee"
    t.float    "totalprice"
    t.string   "bank_name"
    t.string   "bank_account"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_id"
    t.boolean  "export",        default: false
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.boolean  "success"
    t.integer  "count"
    t.boolean  "spot"
    t.float    "janpan_price"
    t.float    "taiwan_price"
    t.integer  "order_id"
  end

  create_table "sellers", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "password_digest"
    t.string   "phone"
    t.integer  "years"
    t.string   "store"
    t.string   "logo"
    t.string   "about"
    t.string   "bank_username"
    t.string   "bank"
    t.string   "bank_branch"
    t.string   "account"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sellers", ["email"], name: "index_sellers_on_email", unique: true
  add_index "sellers", ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true

end
