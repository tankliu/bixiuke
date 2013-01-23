# -*- encoding : utf-8 -*-
class RenameSegmentToPart < ActiveRecord::Migration
  def up
    rename_table :segments, :parts
    rename_table :segments_articles, :parts_articles
    rename_column :parts_articles, :segment_id, :part_id
  end

  def down
    rename_table :parts, :segments
    rename_table :parts_articles, :segments_articles
    rename_column :segments_articles, :part_id, :segment_id
  end
end
