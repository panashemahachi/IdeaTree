class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :idea, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
