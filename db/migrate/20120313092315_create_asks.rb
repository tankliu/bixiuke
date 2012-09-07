# -*- encoding : utf-8 -*-
class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.text :content
      
      t.timestamps
    end
  end
end
