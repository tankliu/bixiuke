class AddOnlineToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :online, :string
  end
end
