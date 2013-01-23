# -*- encoding : utf-8 -*-
class DropAsk < ActiveRecord::Migration
  def up
    drop_table :asks
  end

  def down
    create_table :asks
  end
end
