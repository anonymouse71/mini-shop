class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :address
      t.text :note

      t.timestamps
    end
  end
end
