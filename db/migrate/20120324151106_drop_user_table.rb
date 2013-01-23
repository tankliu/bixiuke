# -*- encoding : utf-8 -*-
class DropUserTable < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table(:users) do |t|
      t.string :name
      t.string :password_digest
      t.string :nick_name      
      t.string :city
      
      t.string :role
      t.string :honor
      t.integer :score

      t.timestamps
    end 
      # Other fields here
  end
end


