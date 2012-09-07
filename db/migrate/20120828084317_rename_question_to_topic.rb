# -*- encoding : utf-8 -*-
class RenameQuestionToTopic < ActiveRecord::Migration
  def up
    rename_table :questions, :topics
    
  end

  def down
    rename_table :topics, :questions
  end
end
