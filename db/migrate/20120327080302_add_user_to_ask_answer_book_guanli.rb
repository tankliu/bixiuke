# -*- encoding : utf-8 -*-
class AddUserToAskAnswerBookGuanli < ActiveRecord::Migration
  def change
    add_column :asks, :user_id, :integer
    add_column :answers, :user_id, :integer
    add_column :guanlis, :user_id, :integer
    
  end
end
