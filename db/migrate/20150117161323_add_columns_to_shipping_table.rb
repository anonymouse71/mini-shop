class AddColumnsToShippingTable < ActiveRecord::Migration
  def up
    rename_table :shippings, :shipments

    add_column :shipments, :first_name, :string
    add_column :shipments, :last_name, :string
    add_column :shipments, :email, :string
    add_column :shipments, :company, :string
    add_column :shipments, :address, :text
    add_column :shipments, :city, :string
    add_column :shipments, :state, :string
    add_column :shipments, :zip_code, :string
    add_column :shipments, :country, :string
    add_column :shipments, :additional_information, :text
    add_column :shipments, :mobile_phone, :string
  end

  def down
    rename_table :shipments, :shippings

    add_column :shippings, :first_name, :string
    add_column :shippings, :last_name, :string
    add_column :shippings, :email, :string
    add_column :shippings, :company, :string
    add_column :shippings, :address, :text
    add_column :shippings, :city, :string
    add_column :shippings, :state, :string
    add_column :shippings, :zip_code, :string
    add_column :shippings, :country, :string
    add_column :shippings, :additional_information, :text
    add_column :shippings, :mobile_phone, :string
  end
end
