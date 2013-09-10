class AddUrlToTopic < ActiveRecord::Migration
  def up   
    add_column :topics, :url, :string
  end

  def down
    remove_column :topics, :url, :string
  end
end
