class RemoveOnlineFromCourse < ActiveRecord::Migration
  def up
    remove_column :courses, :online
  end

  def down
    add_column :courses, :online, :string
  end
end
