# -*- encoding : utf-8 -*-
class RenameGroupToClassroom < ActiveRecord::Migration
  def up
    rename_table :groups, :classrooms
    rename_column :discussions, :group_id, :classroom_id
  end

  def down
    rename_column :discussions, :classroom_id, :group_id
    rename_table :classrooms, :groups
  end
end
