class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :cart_id
      t.string :order_status
      t.datetime :order_date
      t.float :order_total
      t.string :shipping_address
      t.string :message_by_customer
      t.string :comment_by_admin
      t.float :shipping_cost

      t.timestamps
    end
  end
end
