# -*- encoding : utf-8 -*-
class AddDiscountEndDateToCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :category
    add_column :courses, :discount_end_date, :date
  end
end
