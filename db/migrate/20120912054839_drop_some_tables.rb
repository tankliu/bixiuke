# -*- encoding : utf-8 -*-
class DropSomeTables < ActiveRecord::Migration
  def up
    drop_table :girls
    drop_table :organizations
    drop_table :segments
    drop_table :segments_articles
    drop_table :tagables_tags
    drop_table :baikes
    
    
  end

  def down
    create_table :girls
    create_table :organizations
    create_table :segments
    create_table :segments_articles
    create_table :tagables_tags
    create_table :baikes
  end
end
