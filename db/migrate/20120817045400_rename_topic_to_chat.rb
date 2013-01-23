# -*- encoding : utf-8 -*-
class RenameTopicToChat < ActiveRecord::Migration
  def up
    rename_table :topics, :chats
  end

  def down
    rename_table :chats, :topics
  end
end
