# -*- encoding : utf-8 -*-
class RenameSayingToUsage < ActiveRecord::Migration
  def up
    rename_table :sayings, :usages
  end

  def down
    rename_table :usages, :sayings
  end
end
