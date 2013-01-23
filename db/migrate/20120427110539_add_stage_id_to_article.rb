# -*- encoding : utf-8 -*-
class AddStageIdToArticle < ActiveRecord::Migration
  def change
    Article.all.each do |article|
      article.update_attributes!(:stage_id => 1)
    end

    
    # execute <<-SQL
    #       ALTER TABLE articles
    #     SQL
   
  end
end
