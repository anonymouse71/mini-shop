class CreateHomeSliders < ActiveRecord::Migration
  def change
    create_table :home_sliders do |t|
      t.integer :product_id
      t.integer :priority

      t.timestamps
    end
  end
end
