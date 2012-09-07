# -*- encoding : utf-8 -*-
class AddImageToGroup < ActiveRecord::Migration
  def self.up
     change_table :groups do |t|
       t.has_attached_file :image
     end       
   end

   def self.down
     drop_attached_file :groups, :image
   end
   
end
