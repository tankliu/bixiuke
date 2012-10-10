class AddDeadToPerson < ActiveRecord::Migration
  def change
    add_column :people, :dead, :string
  end
end
