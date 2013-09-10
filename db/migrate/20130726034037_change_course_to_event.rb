class ChangeCourseToEvent < ActiveRecord::Migration
  def up
    rename_table :courses, :events
  end

  def down
    rename_table :events, :courses
  end
end
