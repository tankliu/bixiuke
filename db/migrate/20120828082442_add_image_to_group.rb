# -*- encoding : utf-8 -*-
class AddImageToGroup < ActiveRecord::Migration
  def up
    change_table :groups do |t|
      t.has_attached_file :image
    end       
    
  end

  def down
    drop_attached_file :groups, :image
  end
  
end
