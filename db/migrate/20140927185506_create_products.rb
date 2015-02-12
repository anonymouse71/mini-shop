class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :sub_category_id
      t.text :description
      t.text :short_description
      t.float :price
      t.integer :stock
      t.boolean :is_published
      t.integer :main_image_id
      t.string :suppliers

      t.timestamps
    end
  end
end
