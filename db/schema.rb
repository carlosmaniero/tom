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

ActiveRecord::Schema.define(version: 20161024113922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "duels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "first_trend_id"
    t.integer  "second_trend_id"
    t.integer  "winner_trend_id"
    t.boolean  "skipped"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["first_trend_id"], name: "index_duels_on_first_trend_id", using: :btree
    t.index ["second_trend_id"], name: "index_duels_on_second_trend_id", using: :btree
    t.index ["user_id"], name: "index_duels_on_user_id", using: :btree
    t.index ["winner_trend_id"], name: "index_duels_on_winner_trend_id", using: :btree
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trends", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.boolean  "completed"
    t.integer  "industry_id"
    t.integer  "occupation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "anonymous"
    t.index ["industry_id"], name: "index_users_on_industry_id", using: :btree
    t.index ["occupation_id"], name: "index_users_on_occupation_id", using: :btree
  end

  add_foreign_key "duels", "users"
  add_foreign_key "users", "industries"
  add_foreign_key "users", "occupations"
end
