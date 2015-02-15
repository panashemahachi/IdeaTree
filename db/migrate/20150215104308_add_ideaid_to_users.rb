class AddIdeaidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :idea_id, :integer
    add_index :users, :idea_id
  end
end
