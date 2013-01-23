# -*- encoding : utf-8 -*-
class AddTopicIdToSegment < ActiveRecord::Migration
  def change
    add_column :segments, :topic_id, :integer
  end
end
