# -*- encoding : utf-8 -*-
class RemoveBookCategory < ActiveRecord::Migration
  def up
    drop_table :book_categories
    rename_column :books, :book_category_id, :category_id
  end

  def down
    create_table :book_categories
    rename_column :books, :book_category, :book_category_id
  end
end
