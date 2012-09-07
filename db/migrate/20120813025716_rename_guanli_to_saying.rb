# -*- encoding : utf-8 -*-
class RenameGuanliToSaying < ActiveRecord::Migration
  def up
    rename_table :guanlis, :sayings
  end

  def down
    rename_table :sayings, :guanlis
  end
end
