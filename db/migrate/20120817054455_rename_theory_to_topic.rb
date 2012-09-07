# -*- encoding : utf-8 -*-
class RenameTheoryToTopic < ActiveRecord::Migration
  def up
    rename_table :theories, :topics
    rename_column :segments, :theory_id, :topic_id
  end

  def down
    rename_table :topics, :theories
    rename_column :segments, :topic_id, :theory_id
  end
end
