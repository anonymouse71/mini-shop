class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.integer :order_id
      t.string :status
      t.datetime :shipping_date
      t.datetime :received_by_customer_date

      t.timestamps
    end
  end
end
