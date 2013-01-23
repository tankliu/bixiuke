class RemoveAttachmentFromArticle < ActiveRecord::Migration
  def self.up
    drop_attached_file :articles, :attachment
  end

  def self.down
    change_table :articles do |t|
      t.has_attached_file :attachment
    end       
  end
end
