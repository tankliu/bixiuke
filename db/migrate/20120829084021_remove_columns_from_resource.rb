# -*- encoding : utf-8 -*-
class RemoveColumnsFromResource < ActiveRecord::Migration
  def up
    remove_columns :resources, :author, :score
  end

  def down
    add_column :resources, :author, :string
    add_column :resources, :score, :integer
  end
end
