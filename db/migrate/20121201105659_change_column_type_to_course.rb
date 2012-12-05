class ChangeColumnTypeToCourse < ActiveRecord::Migration
  def up
    change_column(:courses, :start_date, :datetime)
    change_column(:courses, :end_date, :datetime)
  end

  def down
    change_column(:courses, :end_date, :date)
    change_column(:courses, :start_date, :date)
    
  end
end
