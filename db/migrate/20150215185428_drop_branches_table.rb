class DropBranchesTable < ActiveRecord::Migration
  def up
    drop_table :branches
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
