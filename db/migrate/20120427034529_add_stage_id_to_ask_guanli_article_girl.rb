# -*- encoding : utf-8 -*-
class AddStageIdToAskGuanliArticleGirl < ActiveRecord::Migration
  def change
    add_column :asks, :stage_id, :integer
    add_column :guanlis, :stage_id, :integer
    add_column :articles, :stage_id, :integer
    add_column :girls, :stage_id, :integer
    
  end
end
