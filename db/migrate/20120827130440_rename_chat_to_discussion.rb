# -*- encoding : utf-8 -*-
class RenameChatToDiscussion < ActiveRecord::Migration
  def up
    rename_table :chats, :discussions
  end

  def down
    rename_table :discussions, :chats
  end
end
