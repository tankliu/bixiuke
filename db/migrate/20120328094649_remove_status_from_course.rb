# -*- encoding : utf-8 -*-
class RemoveStatusFromCourse < ActiveRecord::Migration
  #移除原因:能根据日期自动推测出状态,没必要增加status
  def up
    remove_column :courses, :status
  end

  def down
    add_column :courses, :status, :string
  end
end
