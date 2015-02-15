class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :short_description
      t.text :description

      t.timestamps
    end
  end
end