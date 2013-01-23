# -*- encoding : utf-8 -*-
class RenameDescriptionToContentForApp < ActiveRecord::Migration
  def up
    rename_column :apps, :description, :content
  end

  def down
    rename_column :apps, :content, :description
  end
end
