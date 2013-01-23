# -*- encoding : utf-8 -*-
class RenameNameToTitleForApp < ActiveRecord::Migration
  def up
    rename_column :apps, :name, :title
  end

  def down
    rename_column :apps, :title, :name
  end
end
