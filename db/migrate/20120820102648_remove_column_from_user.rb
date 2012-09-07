# -*- encoding : utf-8 -*-
class RemoveColumnFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :shape, :height, :score
    
  end

  def down
    add_column :users, :height, :integer
    add_column :users, :shape, :string
    add_column :users, :score, :integer
  end
end
