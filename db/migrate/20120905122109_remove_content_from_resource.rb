class RemoveContentFromResource < ActiveRecord::Migration
  def up
    remove_column :resources, :description
  end

  def down
    add_column :resources, :description, :text
  end
end
