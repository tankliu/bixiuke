# -*- encoding : utf-8 -*-
class CreateGuanlis < ActiveRecord::Migration
  def change
    create_table :guanlis do |t|
      t.text :content
      t.timestamps
    end
  end
end
