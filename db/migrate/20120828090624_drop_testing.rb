# -*- encoding : utf-8 -*-
class DropTesting < ActiveRecord::Migration
  def up
    drop_table :testings
  end

  def down
    create_table :testings
  end
end
