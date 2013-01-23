# -*- encoding : utf-8 -*-
class AddDeadToPerson < ActiveRecord::Migration
  def change
    add_column :people, :dead, :string
  end
end
