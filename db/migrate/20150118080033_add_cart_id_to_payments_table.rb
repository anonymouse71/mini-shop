class AddCartIdToPaymentsTable < ActiveRecord::Migration
  def change
    rename_column :payments, :transection_number, :transaction_number
    add_column :payments, :cart_id, :integer
    add_column :payments, :transaction_mobile_number, :string
  end
end
