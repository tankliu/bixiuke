# -*- encoding : utf-8 -*-
class AddThingIdToAsk < ActiveRecord::Migration
  def change
    add_column :asks, :thing_id, :integer
  end
end
