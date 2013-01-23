# -*- encoding : utf-8 -*-
class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :content
      t.integer :views
      t.text :attachments
      t.timestamps
    end
  end
end
