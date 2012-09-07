# -*- encoding : utf-8 -*-
class AddKinoToGirl < ActiveRecord::Migration
  def change
    add_column :girls, :kino, :string
  end
end
