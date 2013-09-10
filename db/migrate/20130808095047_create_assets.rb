class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :topic_id

      t.timestamps
    end
    add_attachment :assets, :image
  end
end

