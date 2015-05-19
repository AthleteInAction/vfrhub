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

ActiveRecord::Schema.define(version: 20150514061127) do

  create_table "chimes", force: true do |t|
    t.string   "category"
    t.integer  "rating"
    t.date     "interaction_date"
    t.string   "site"
    t.text     "body"
    t.text     "body_html"
    t.string   "body_short"
    t.string   "employer"
    t.string   "job_title"
    t.string   "location"
    t.string   "school"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "author_id"
    t.integer  "flagged",          default: 0
  end

  create_table "socials", force: true do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "profile"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "gender"
    t.integer  "birth_month"
    t.integer  "birth_date"
    t.integer  "birth_year"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "image"
    t.integer  "author_id"
    t.boolean  "floating",         default: false
    t.string   "promo_code"
    t.datetime "last_active"
    t.string   "token"
    t.datetime "token_expiration"
    t.date     "birthdate"
    t.integer  "access",           default: 0
  end

end
