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

ActiveRecord::Schema.define(version: 20160201213309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrollments", force: :cascade do |t|
    t.integer  "mutant_id"
    t.integer  "term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollments", ["mutant_id"], name: "index_enrollments_on_mutant_id", using: :btree
  add_index "enrollments", ["term_id"], name: "index_enrollments_on_term_id", using: :btree

  create_table "mutants", force: :cascade do |t|
    t.string   "mutant_name"
    t.string   "power"
    t.string   "real_name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.datetime "eligibility_begins_at"
    t.datetime "eligibility_ends_at"
    t.datetime "may_advise_beginning_at"
    t.integer  "advisor_id"
  end

  create_table "terms", force: :cascade do |t|
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrollments", "mutants"
  add_foreign_key "enrollments", "terms"
end
