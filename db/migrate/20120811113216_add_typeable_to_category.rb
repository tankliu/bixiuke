# -*- encoding : utf-8 -*-
class AddTypeableToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :typeable, :string,:default => "Article"
  end
end
