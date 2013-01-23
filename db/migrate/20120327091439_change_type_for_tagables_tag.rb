# -*- encoding : utf-8 -*-
class ChangeTypeForTagablesTag < ActiveRecord::Migration
  def up
    add_column :tagables_tags, :tagable_type, :string
  end

  def down
    remove_column :tagables_tags, :tagable_type
  end
end
