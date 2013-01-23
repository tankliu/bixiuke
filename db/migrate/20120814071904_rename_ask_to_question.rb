# -*- encoding : utf-8 -*-
class RenameAskToQuestion < ActiveRecord::Migration
  def up
    rename_table :asks, :questions
  end

  def down
    rename_table :questions, :asks
  end
end
