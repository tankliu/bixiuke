# -*- encoding : utf-8 -*-
class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :title
      t.integer :order_number
      t.references :user

      t.timestamps
    end
    add_index :things, :user_id
  end
end
