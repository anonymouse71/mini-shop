class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :date, :after => :email
    add_column :users, :mobile, :string, :after => :email
  end
end
