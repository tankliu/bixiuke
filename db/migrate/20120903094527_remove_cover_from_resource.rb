# -*- encoding : utf-8 -*-
class RemoveCoverFromResource < ActiveRecord::Migration
  def self.up
     drop_attached_file :resources, :cover
   end

   def self.down
     change_table :resources do |t|
        t.has_attached_file :cover
     end
   end
end
