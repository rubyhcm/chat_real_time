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

ActiveRecord::Schema.define(version: 4) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "dblink"
  enable_extension "xml2"
  enable_extension "ltree"
  enable_extension "pgstattuple"
  enable_extension "tablefunc"
  enable_extension "fuzzystrmatch"
  enable_extension "citext"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"
  enable_extension "pg_trgm"
  enable_extension "intarray"
  enable_extension "hstore"
  enable_extension "dict_int"
  enable_extension "btree_gin"
  enable_extension "pgrowlocks"
  enable_extension "cube"
  enable_extension "earthdistance"
  enable_extension "btree_gist"
  enable_extension "dict_xsyn"
  enable_extension "unaccent"
  enable_extension "pg_stat_statements"

  create_table "chatrooms", force: :cascade do |t|
    t.string   "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "chatroom_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
end
