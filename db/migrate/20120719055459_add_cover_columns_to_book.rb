# -*- encoding : utf-8 -*-
class AddCoverColumnsToBook < ActiveRecord::Migration
  def self.up
     change_table :books do |t|
       t.has_attached_file :cover
     end       
   end

   def self.down
     drop_attached_file :books, :cover
   end

end
