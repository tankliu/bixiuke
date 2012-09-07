class RenameUsageToNote < ActiveRecord::Migration
  def up
    rename_table :usages, :notes
  end

  def down
    rename_table :notes, :usages
  end
end
