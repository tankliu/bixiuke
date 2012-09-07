# -*- encoding : utf-8 -*-
class CreateTagablesTags < ActiveRecord::Migration
  def change
    create_table :tagables_tags do |t|
      t.integer :tag_id
      t.integer :tagable_id
      t.string :type


      t.timestamps
    end
  end
end
