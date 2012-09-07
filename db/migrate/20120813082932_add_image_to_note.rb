# -*- encoding : utf-8 -*-
class AddImageToNote < ActiveRecord::Migration
  def up
    change_table :notes do |t|
      t.has_attached_file :image
    end       
    
  end

  def down
    t.drop_attached_file :notes, :image
  end
end
