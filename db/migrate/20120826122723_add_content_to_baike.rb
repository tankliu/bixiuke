# -*- encoding : utf-8 -*-
class AddContentToBaike < ActiveRecord::Migration
  def change
    add_column :baikes, :content, :text
  end
end
