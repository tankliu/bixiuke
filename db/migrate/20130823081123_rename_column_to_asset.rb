class RenameColumnToAsset < ActiveRecord::Migration
  def up
    rename_column :assets, :type, :asset_type
  end

  def down
    rename_column :assets, :asset_type, :type
  end
end
