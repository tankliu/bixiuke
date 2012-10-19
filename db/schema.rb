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

ActiveRecord::Schema.define(:version => 20121016054833) do

  create_table "apps", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "answer"
  end

  add_index "apps", ["person_id"], :name => "index_apps_on_user_id"

  create_table "articles", :force => true do |t|
    t.integer  "person_id"
    t.string   "title"
    t.text     "description"
    t.text     "content"
    t.integer  "views"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "category_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "order_number"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "typeable",            :default => "Article"
    t.string   "path"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "person_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "classrooms", ["person_id"], :name => "index_groups_on_user_id"

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "person_id"
    t.string   "commable_type"
    t.integer  "commable_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "comments", ["person_id"], :name => "index_comments_on_user_id"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "holiday"
    t.string   "city"
    t.integer  "top_number"
    t.integer  "now_number"
    t.string   "teacher"
    t.integer  "cost"
    t.integer  "discount"
    t.string   "discount_requirement"
    t.integer  "deposite"
    t.integer  "person_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "category"
  end

  add_index "courses", ["person_id"], :name => "index_courses_on_user_id"

  create_table "discussions", :force => true do |t|
    t.text     "content"
    t.integer  "person_id"
    t.integer  "classroom_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "primary_chat_id"
  end

  add_index "discussions", ["classroom_id"], :name => "index_topics_on_group_id"
  add_index "discussions", ["person_id"], :name => "index_topics_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "person_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "groups", ["person_id"], :name => "index_groups_on_user_id"

  create_table "notes", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "person_id"
    t.integer  "category_id"
  end

  create_table "options", :force => true do |t|
    t.integer  "app_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "options", ["app_id"], :name => "index_options_on_app_id"

  create_table "people", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "nick_name"
    t.string   "city"
    t.string   "role"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "job"
    t.integer  "age"
    t.string   "education"
    t.integer  "salary"
    t.string   "marriage"
    t.integer  "score"
    t.string   "sex"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "dead"
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.string   "download_link"
    t.integer  "category_id"
    t.integer  "person_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "title"
    t.integer  "order_number"
    t.integer  "person_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "cheers"
  end

  add_index "subjects", ["person_id"], :name => "index_things_on_user_id"

  create_table "topics", :force => true do |t|
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "person_id"
    t.string   "title"
    t.integer  "group_id"
  end

end
