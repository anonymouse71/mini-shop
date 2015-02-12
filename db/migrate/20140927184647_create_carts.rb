class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.float :shipping_cost

      t.timestamps
    end
  end
end
