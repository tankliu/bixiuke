# -*- encoding : utf-8 -*-
class RemoveScoreFromUser < ActiveRecord::Migration
  def up
    remove_columns :users, :score, :honor
  end

  def down
    add_column :users, :score, :integer
    add_column :users, :honor, :string
  end 
end

