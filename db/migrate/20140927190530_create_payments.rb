class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.string :payment_type
      t.string :status
      t.string :transection_number
      t.float :amount

      t.timestamps
    end
  end
end
