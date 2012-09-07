# -*- encoding : utf-8 -*-
class DropExplanation < ActiveRecord::Migration
  def up
    drop_table :explanations
  end

  def down
    create_table :explanations
  end
end
