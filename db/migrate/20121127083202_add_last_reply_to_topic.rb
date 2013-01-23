class AddLastReplyToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :last_replied_by, :string
    add_column :topics, :last_replied_at, :datetime
  end
end
