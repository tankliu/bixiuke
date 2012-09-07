# -*- encoding : utf-8 -*-
class RemoveImageFromNote < ActiveRecord::Migration
  def up
    drop_attached_file :notes, :image
  end

  def down
    change_table :notes do |t|
      t.has_attached_file :image
    end
  end
  
end
