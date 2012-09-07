# -*- encoding : utf-8 -*-
class AddTitleToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :title, :string
  end
end
