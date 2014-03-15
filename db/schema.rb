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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140315172446) do

  create_table "wb_access_tokens", :force => true do |t|
    t.integer  "wb_user_id",                   :null => false
    t.string   "value",                        :null => false
    t.integer  "expires_at",                   :null => false
    t.integer  "success_count", :default => 0, :null => false
    t.integer  "error_count",   :default => 0, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "wb_access_tokens", ["wb_user_id"], :name => "index_wb_access_tokens_on_wb_user_id"

  create_table "wb_users", :force => true do |t|
    t.integer  "wb_id",              :null => false
    t.string   "screen_name"
    t.string   "name",               :null => false
    t.string   "province"
    t.string   "city"
    t.string   "location"
    t.string   "description"
    t.string   "url"
    t.string   "profile_image_url"
    t.string   "domain"
    t.string   "gender"
    t.integer  "followers_count"
    t.integer  "statuses_count"
    t.integer  "favourites_count"
    t.datetime "joined_at"
    t.boolean  "verified"
    t.string   "avatar_large"
    t.string   "verified_reason"
    t.integer  "bi_followers_count"
    t.string   "lang"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "wb_users", ["wb_id"], :name => "index_wb_users_on_wb_id", :unique => true

end