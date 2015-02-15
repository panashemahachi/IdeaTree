class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :branch_name
      t.text :branch_description
      t.references :idea, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
