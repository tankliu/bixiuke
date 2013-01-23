# -*- encoding : utf-8 -*-
class DropAnswer < ActiveRecord::Migration
  def up
    drop_table :answers
  end

  def down
    create_table :answers
  end
end
