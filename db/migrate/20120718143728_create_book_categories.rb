# -*- encoding : utf-8 -*-
class CreateBookCategories < ActiveRecord::Migration
  def change
    create_table :book_categories do |t|
      t.string :name
      t.integer :order_number

      t.timestamps
    end
  end
end
