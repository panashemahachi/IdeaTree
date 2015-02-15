class AddUserInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :headline, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_pic, :string
  end
end
