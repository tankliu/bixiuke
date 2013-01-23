# -*- encoding : utf-8 -*-
class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :download_link
      t.text :description
      t.integer :score
      t.integer :book_category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
