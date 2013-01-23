# -*- encoding : utf-8 -*-
class AddSexToUser < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string
  end
end
