class AddCategoryIdToTopic < ActiveRecord::Migration
  def change    
      add_column :topics, :category_id, :integer
      add_column :topics, :url, :string
  end         
  
end
