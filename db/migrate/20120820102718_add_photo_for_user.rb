# -*- encoding : utf-8 -*-
class AddPhotoForUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.has_attached_file :photo
    end       
    
  end

  def down
    drop_attached_file :users, :photo
  end
end
