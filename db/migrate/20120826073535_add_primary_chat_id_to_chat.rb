# -*- encoding : utf-8 -*-
class AddPrimaryChatIdToChat < ActiveRecord::Migration
  def change
    add_column :chats, :primary_chat_id, :integer
  end
end
