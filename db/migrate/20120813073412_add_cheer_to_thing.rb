# -*- encoding : utf-8 -*-
class AddCheerToThing < ActiveRecord::Migration
  def change
    add_column :things, :cheers, :integer
  end
end
