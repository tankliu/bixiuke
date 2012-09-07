# -*- encoding : utf-8 -*-
class RemoveTitleFromNote < ActiveRecord::Migration
  def up
    remove_column :notes, :title
  end

  def down
    add_column :notes, :title, :string
  end
end
