class RemoveContentHtmlForDisucssion < ActiveRecord::Migration
  def up
    remove_column :discussions, :content_html
  end

  def down
    add_column :discussions, :content_html, :text
    
  end
end
