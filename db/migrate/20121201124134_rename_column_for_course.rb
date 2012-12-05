class RenameColumnForCourse < ActiveRecord::Migration
  def up
    rename_column :courses, :start_date, :start_datetime
    rename_column :courses, :end_date, :end_datetime
  end

  def down
    rename_column :courses, :start_datetime, :start_date
    rename_column :courses, :end_datetime, :end_date
  end
end
