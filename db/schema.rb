# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110425073102) do

  create_table "action_dailies", :force => true do |t|
    t.integer  "gateway_id"
    t.integer  "spot_id"
    t.integer  "action_type"
    t.integer  "schedule_dailies_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "action_weeklies", :force => true do |t|
    t.integer  "action_type"
    t.integer  "schedule_weeklies_id"
    t.integer  "spot_id"
    t.integer  "gateway_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gateways", :force => true do |t|
    t.string   "address"
    t.integer  "port"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "record_files", :force => true do |t|
    t.integer  "spot_id"
    t.integer  "gateway_id"
    t.date     "record_date"
    t.integer  "start_hour"
    t.integer  "start_min"
    t.integer  "end_hour"
    t.integer  "end_min"
    t.string   "path_file"
    t.integer  "state",       :default => 0
    t.string   "error"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_dailies", :force => true do |t|
    t.integer  "spot_id"
    t.date     "schedule_date"
    t.integer  "start_hour"
    t.integer  "start_min"
    t.integer  "end_hour"
    t.integer  "end_min"
    t.integer  "last_time"
    t.integer  "enabled"
    t.integer  "state",         :default => 0
    t.integer  "color",         :default => -1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_weeklies", :force => true do |t|
    t.integer  "spot_id"
    t.integer  "week_day"
    t.integer  "start_hour"
    t.integer  "start_min"
    t.integer  "end_hour"
    t.integer  "end_min"
    t.integer  "last_time"
    t.integer  "enabled"
    t.integer  "state",      :default => 0
    t.integer  "color",      :default => -1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spots", :force => true do |t|
    t.integer  "gateway_id"
    t.integer  "seq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
