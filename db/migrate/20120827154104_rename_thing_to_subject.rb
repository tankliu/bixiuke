# -*- encoding : utf-8 -*-
class RenameThingToSubject < ActiveRecord::Migration
  def up
    rename_table :things, :subjects
    rename_column :notes, :thing_id, :subject_id
  end

  def down
    rename_column :notes, :subject_id, :thing_id
    rename_table :subjects, :things
  end
end
