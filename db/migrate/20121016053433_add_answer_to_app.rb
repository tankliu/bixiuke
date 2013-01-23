# -*- encoding : utf-8 -*-
class AddAnswerToApp < ActiveRecord::Migration
  def change
    add_column :apps, :answer, :string
  end
end
