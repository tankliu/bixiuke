# -*- encoding : utf-8 -*-
class ProcessDataForArticles < ActiveRecord::Migration
  def up
    Article.all.each do |article|
      if article.description.length == 500
        article.update_attribute(:description, article.content[0,1500])
      end
    end
  end

  def down

  end
end
