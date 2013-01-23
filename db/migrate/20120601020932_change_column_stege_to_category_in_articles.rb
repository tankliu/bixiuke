# -*- encoding : utf-8 -*-
class ChangeColumnStegeToCategoryInArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :stage_id
    add_column :articles, :category_id, :integer
  end

  def down
    remove_column :articles, :category_id
    add_column :articles, :stage_id, :integer
  end
end
