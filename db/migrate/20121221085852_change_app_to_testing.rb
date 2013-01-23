class ChangeAppToTesting < ActiveRecord::Migration
  def up
    rename_table :apps, :testings
  end

  def down
    rename_table :testings, :apps
  end
end
