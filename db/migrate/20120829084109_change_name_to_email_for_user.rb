# -*- encoding : utf-8 -*-
class ChangeNameToEmailForUser < ActiveRecord::Migration
  def up
    rename_column :users, :name, :email
  end

  def down
    rename_column :users, :email, :name
  end
end
