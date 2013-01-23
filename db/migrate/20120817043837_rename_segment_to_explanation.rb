# -*- encoding : utf-8 -*-
class RenameSegmentToExplanation < ActiveRecord::Migration
  def up
    rename_table :segments, :explanations;
  end

  def down
    rename_table :explanations, :segments
  end
end
