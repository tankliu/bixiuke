# -*- encoding : utf-8 -*-
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user
      t.string :commable_type
      t.integer :commable_id

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
