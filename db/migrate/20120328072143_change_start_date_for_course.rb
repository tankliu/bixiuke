# -*- encoding : utf-8 -*-
class ChangeStartDateForCourse < ActiveRecord::Migration
  def up
    rename_column :courses, :start_date, :start_date
  end

  def down
    rename_column :courses, :start_date, :start_date
  end
end
