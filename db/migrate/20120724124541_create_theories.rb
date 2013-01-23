# -*- encoding : utf-8 -*-
class CreateTheories < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :views
      t.has_attached_file :photo
      t.timestamps      
    end
  end
end
