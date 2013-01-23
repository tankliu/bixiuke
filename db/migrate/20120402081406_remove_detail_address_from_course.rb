# -*- encoding : utf-8 -*-
class RemoveDetailAddressFromCourse < ActiveRecord::Migration
  def up
    remove_column :courses, :detail_address
  end

  def down
    add_column :courses, :detail_address, :string
  end
end
