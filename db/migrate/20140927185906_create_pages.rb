class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :permalink
      t.text :content
      t.integer :priority
      t.boolean :is_published

      t.timestamps
    end
  end
end
