class AddPictureToArticle < ActiveRecord::Migration
  
  def self.up
     change_table :articles do |t|
       t.has_attached_file :picture
     end       
   end

   def self.down
     drop_attached_file :articles, :picture
   end
   
   
end
