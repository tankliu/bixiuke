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

ActiveRecord::Schema.define(:version => 20130823081123) do

  create_table "articles", :force => true do |t|
    t.integer  "person_id"
    t.string   "title"
    t.text     "description"
    t.text     "content"
    t.integer  "views"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "category_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "assets", :force => true do |t|
    t.integer  "topic_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "asset_type"
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

  create_table "discussions", :force => true do |t|
    t.text     "content"
    t.integer  "person_id"
    t.integer  "classroom_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "discussions", ["classroom_id"], :name => "index_topics_on_group_id"
  add_index "discussions", ["person_id"], :name => "index_topics_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
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

  add_index "events", ["person_id"], :name => "index_courses_on_user_id"

  create_table "grades", :force => true do |t|
    t.integer "score"
    t.integer "person_id"
  end

  add_index "grades", ["person_id"], :name => "index_grades_on_person_id"

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
    t.string   "title"
  end

  create_table "options", :force => true do |t|
    t.integer  "testing_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "options", ["testing_id"], :name => "index_options_on_app_id"

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

  create_table "testings", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "answer"
  end

  add_index "testings", ["person_id"], :name => "index_apps_on_user_id"

  create_table "topics", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "person_id"
    t.string   "title"
    t.integer  "group_id"
    t.string   "last_replied_by"
    t.datetime "last_replied_at"
    t.integer  "category_id"
    t.string   "url"
  end

end
