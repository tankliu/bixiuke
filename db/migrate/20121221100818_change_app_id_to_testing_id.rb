class ChangeAppIdToTestingId < ActiveRecord::Migration
  def up
    rename_column :options, :app_id, :testing_id
  end

  def down
    rename_column :options, :testing_id, :app_id
  end
end
