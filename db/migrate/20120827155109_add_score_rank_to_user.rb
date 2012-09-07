# -*- encoding : utf-8 -*-
class AddScoreRankToUser < ActiveRecord::Migration
  def change
    add_column :users, :score, :integer
  end
end
