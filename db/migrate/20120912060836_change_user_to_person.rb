# -*- encoding : utf-8 -*-
class ChangeUserToPerson < ActiveRecord::Migration
  def up
    rename_table :users, :people
    rename_column :apps, :user_id, :person_id
    rename_column :articles, :user_id, :person_id
    rename_column :classrooms, :user_id, :person_id
    rename_column :comments, :user_id, :person_id
    rename_column :courses, :user_id, :person_id
    rename_column :discussions, :user_id, :person_id
    rename_column :groups, :user_id, :person_id
    rename_column :notes, :user_id, :person_id
    rename_column :resources, :user_id, :person_id
    rename_column :subjects, :user_id, :person_id
    rename_column :topics, :user_id, :person_id
    
  end

  def down
    rename_table :people, :users, :user_id
    rename_column :apps,  :person_id, :user_id
    rename_column :articles,  :person_id, :user_id
    rename_column :classrooms,  :person_id, :user_id
    rename_column :comments,  :person_id, :user_id
    rename_column :events,  :person_id, :user_id
    rename_column :discussions,  :person_id, :user_id
    rename_column :groups,  :person_id, :user_id
    rename_column :notes,  :person_id, :user_id
    rename_column :resources,  :person_id, :user_id
    rename_column :subjects,  :person_id, :user_id
    rename_column :topics,  :person_id, :user_id
    
  end
end
