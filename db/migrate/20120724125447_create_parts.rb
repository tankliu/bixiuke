# -*- encoding : utf-8 -*-
class CreateParts < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :title
      t.text :description
      t.integer :order_number
      t.has_attached_file :photo
      t.timestamps
    end
  end
end
