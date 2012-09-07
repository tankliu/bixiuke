# -*- encoding : utf-8 -*-
class RenameTopicToOrganization < ActiveRecord::Migration
  def up
    rename_table :topics, :organizations;
    rename_column :segments, :topic_id, :organization_id
  end

  def down
    rename_table :organizations, :topics
    rename_column :segments, :organization_id, :topic_id
  end
end
