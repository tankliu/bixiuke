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

ActiveRecord::Schema.define(:version => 20120905122109) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "apps", ["user_id"], :name => "index_apps_on_user_id"

  create_table "articles", :force => true do |t|
    t.integer  "user_id"
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

  create_table "baikes", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "content"
  end

  add_index "baikes", ["user_id"], :name => "index_baikes_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "order_number"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "typeable",     :default => "Article"
  end

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "classrooms", ["user_id"], :name => "index_groups_on_user_id"

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.string   "commable_type"
    t.integer  "commable_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

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
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "category"
  end

  add_index "courses", ["user_id"], :name => "index_courses_on_user_id"

  create_table "discussions", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "classroom_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "primary_chat_id"
  end

  add_index "discussions", ["classroom_id"], :name => "index_topics_on_group_id"
  add_index "discussions", ["user_id"], :name => "index_topics_on_user_id"

  create_table "girls", :force => true do |t|
    t.string   "nick_name"
    t.integer  "height"
    t.string   "shape"
    t.integer  "score"
    t.string   "job"
    t.integer  "age"
    t.string   "education"
    t.integer  "salary"
    t.string   "marriage"
    t.string   "distance"
    t.string   "meet"
    t.string   "intercourse_length"
    t.string   "motive"
    t.text     "story"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "kino"
    t.integer  "category_id"
  end

  add_index "girls", ["user_id"], :name => "index_girls_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "groups", ["user_id"], :name => "index_groups_on_user_id"

  create_table "notes", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "category_id"
  end

  create_table "organizations", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "views"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.string   "download_link"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "segments", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "order_number"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "organization_id"
  end

  create_table "segments_articles", :force => true do |t|
    t.integer  "segment_id"
    t.integer  "article_id"
    t.integer  "order_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "title"
    t.integer  "order_number"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "cheers"
  end

  add_index "subjects", ["user_id"], :name => "index_things_on_user_id"

  create_table "tagables_tags", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "tagable_id"
    t.string   "type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "tagable_type"
  end

  create_table "topics", :force => true do |t|
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.string   "title"
    t.integer  "group_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "nick_name"
    t.string   "city"
    t.string   "role"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "job"
    t.integer  "age"
    t.string   "education"
    t.integer  "salary"
    t.string   "marriage"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "score"
    t.string   "sex"
  end

end
