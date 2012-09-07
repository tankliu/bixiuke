# -*- encoding : utf-8 -*-
class RemoveThingIdFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :thing_id
  end

  def down
    add_column :questions, :thing_id, :integer
  end
end
