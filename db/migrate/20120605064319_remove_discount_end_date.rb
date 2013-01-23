# -*- encoding : utf-8 -*-
class RemoveDiscountEndDate < ActiveRecord::Migration
  def up
    remove_column :courses, :discount_end_date
    remove_column :courses, :join_requirement
  end

  def down
    add_column :courses, :discount_end_date, :date
    add_column :courses, :join_requirement, :string
  end
end
