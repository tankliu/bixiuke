# -*- encoding : utf-8 -*-
class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :apps, :user_id
  end
end
