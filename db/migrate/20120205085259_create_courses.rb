# -*- encoding : utf-8 -*-
class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :category
      t.date :start_date
      t.date :end_date
      t.string :holiday
      t.string :city
      t.integer :top_number
      t.integer :now_number
      t.string :teacher
      t.integer :cost
      t.integer :discount
      t.string :discount_requirement
      t.integer :deposite
      t.string :status
      t.text :join_requirement
      
      t.references :user

      t.timestamps
    end
    add_index :courses, :user_id
  end
end
