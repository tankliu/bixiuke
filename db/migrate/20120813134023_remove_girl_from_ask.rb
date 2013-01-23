# -*- encoding : utf-8 -*-
class RemoveGirlFromAsk < ActiveRecord::Migration
  def up
    remove_column :asks, :girl_id
  end

  def down
    add_column :asks, :girl_id, :integer
  end
end
