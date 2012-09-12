class ChangePhotoToAvatar < ActiveRecord::Migration
  def up
    drop_attached_file :people, :photo
    change_table :people do |t|
      t.has_attached_file :avatar
    end
    
    drop_attached_file :classrooms, :image
    change_table :classrooms do |t|
      t.has_attached_file :avatar
    end
    
    drop_attached_file :groups, :image
    change_table :groups do |t|
      t.has_attached_file :avatar
    end
    
    
  end

  def down
    drop_attached_file :people, :avatar
    change_table :people do |t|
      t.has_attached_file :photo
    end
    
    drop_attached_file :classrooms, :avatar
    change_table :classrooms do |t|
      t.has_attached_file :image
    end
    
    drop_attached_file :groups, :avatar
    change_table :groups do |t|
      t.has_attached_file :image
    end
  end
end
