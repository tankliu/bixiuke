# -*- encoding : utf-8 -*-
class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :app
      t.text :content

      t.timestamps
    end
    add_index :options, :app_id
  end
end
