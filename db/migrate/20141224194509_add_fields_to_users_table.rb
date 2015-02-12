class AddFieldsToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender,:string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :profile_picture, :string
    add_column :users, :profile_picture_provider, :string
  end
end