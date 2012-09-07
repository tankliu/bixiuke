# -*- encoding : utf-8 -*-
class CreateUserTable < ActiveRecord::Migration
  def up
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
  end

  def down
    drop_table :users
  end
end
