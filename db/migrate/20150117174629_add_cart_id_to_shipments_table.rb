class AddCartIdToShipmentsTable < ActiveRecord::Migration
  def change
    add_column :shipments, :cart_id, :integer
  end
end
