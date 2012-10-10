class AddImageToCategory < ActiveRecord::Migration
  def up
    change_table :categories do |t|
      t.has_attached_file :avatar
    end       
  end

  def down
    drop_attached_file :categories, :avatar
  end

end
