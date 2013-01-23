# -*- encoding : utf-8 -*-
class AddGirlToAsk < ActiveRecord::Migration
  def change
    add_column :asks, :girl_id, :integer
  end
end
