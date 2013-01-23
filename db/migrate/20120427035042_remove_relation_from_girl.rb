# -*- encoding : utf-8 -*-
class RemoveRelationFromGirl < ActiveRecord::Migration
  def up
    remove_column :girls, :relation
  end

  def down
    add_column :girls, :relation, :string
  end
end
