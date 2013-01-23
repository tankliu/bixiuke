# -*- encoding : utf-8 -*-
class AddDetailAddressToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :detail_address, :string
  end
end
