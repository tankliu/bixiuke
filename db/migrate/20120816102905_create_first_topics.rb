# -*- encoding : utf-8 -*-
class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :content
      t.references :user
      t.references :group

      t.timestamps
    end
    add_index :topics, :user_id
    add_index :topics, :group_id
  end
end
