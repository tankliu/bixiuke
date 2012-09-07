# -*- encoding : utf-8 -*-
class AddAttachmentColumnsToArticle < ActiveRecord::Migration
  def self.up
     change_table :articles do |t|
       t.has_attached_file :attachment
     end       
   end

   def self.down
     drop_attached_file :articles, :attachment
   end
   
end
