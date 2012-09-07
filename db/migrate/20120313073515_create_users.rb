# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :nick_name      
      t.string :city
      
      t.string :role
      t.string :honor
      t.integer :score

      t.timestamps
    end
    
  end
end
