class CreateBillingDetails < ActiveRecord::Migration
  def change
    create_table :billing_details do |t|
      t.integer :order_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.text :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.text :additional_information
      t.string :mobile_phone
      t.integer :cart_id

      t.timestamps
    end
  end
end
