# -*- encoding : utf-8 -*-
class AddCategoryToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :category, :string
  end
end
