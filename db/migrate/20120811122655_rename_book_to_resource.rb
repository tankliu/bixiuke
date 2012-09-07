# -*- encoding : utf-8 -*-
class RenameBookToResource < ActiveRecord::Migration
  def up
    rename_table :books, :resources
  end

  def down
    rename_table :resources, :books
  end
end
