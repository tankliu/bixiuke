# -*- encoding : utf-8 -*-
class RemoveStageIdFromAsk < ActiveRecord::Migration
  def up
    remove_column :asks, :stage_id
  end

  def down
    add_column :asks, :stage_id, :integer
  end
end
