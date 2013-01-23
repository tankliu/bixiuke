# -*- encoding : utf-8 -*-
class RenameStageToCategory < ActiveRecord::Migration
  def up
    rename_column :girls, :stage_id, :category_id
    rename_column :sayings, :stage_id, :category_id
    drop_table :stages
  end

  def down
    create_table :stages
    rename_column :sayings, :category_id, :stage_id
    rename_column :girls, :category_id, :stage_id
  end
end
