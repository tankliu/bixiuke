# -*- encoding : utf-8 -*-
class RenameAskIdFromAnswer < ActiveRecord::Migration
  def up
    remove_index :answers, :ask_id
    rename_column :answers, :ask_id, :question_id
  end

  def down
    rename_column :answers, :question_id, :ask_id
    add_index :answers, :ask_id
  end
end
