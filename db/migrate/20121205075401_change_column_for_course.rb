class ChangeColumnForCourse < ActiveRecord::Migration
  def up
    rename_column :courses, :start_datetime, :start_at
    rename_column :courses, :end_datetime, :end_at
    
  end

  def down
    rename_column :courses, :end_at, :end_datetime
    rename_column :courses, :start_at, :start_datetime
    
  end
end
