# -*- encoding : utf-8 -*-
class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.references :ask

      t.timestamps
    end
    add_index :answers, :ask_id
  end
end
