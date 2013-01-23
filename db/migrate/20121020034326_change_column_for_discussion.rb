class ChangeColumnForDiscussion < ActiveRecord::Migration
  def up
    remove_column :discussions, :primary_chat_id
    add_column :discussions, :content_html, :text
  end

  def down
    add_column :discussions, :primary_chat_id, :integer
    remove_column :discussions, :content_html
  end
end
