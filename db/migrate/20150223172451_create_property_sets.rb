class CreatePropertySets < ActiveRecord::Migration
  def change
    create_table :property_sets do |t|
      t.string    :name
      t.text      :properties
      t.integer   :product_id

      t.timestamps
    end
  end
end
