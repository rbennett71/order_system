class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku, limit: 10
      t.integer :count
      t.text :description
      # t.references :vendor, foreign_key: true
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :sku, unique: true
  end
end
