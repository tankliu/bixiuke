# -*- encoding : utf-8 -*-
class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :height, :integer
    add_column :users, :shape, :string
    add_column :users, :score, :integer
    add_column :users, :age, :integer
    add_column :users, :education, :string
    add_column :users, :job, :string
    add_column :users, :salary, :integer
    add_column :users, :marriage, :string    
  end
end
