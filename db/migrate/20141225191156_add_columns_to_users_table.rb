class AddColumnsToUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string

    add_column :users, :last_name, :string, :after => :id
    add_column :users, :first_name, :string, :after => :id
  end
end
