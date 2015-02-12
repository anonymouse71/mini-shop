class AddIsDeletedToProductsTable < ActiveRecord::Migration
  def up
    add_column :products, :is_deleted, :boolean
  end

  def down
    remove_column :products, :is_deleted
  end
end
