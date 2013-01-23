# -*- encoding : utf-8 -*-
class AddGroupIdToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :group_id, :integer
  end
end
