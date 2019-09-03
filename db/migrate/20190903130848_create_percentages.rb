class CreatePercentages < ActiveRecord::Migration[5.2]
  def change
    create_table :percentages do |t|
      t.integer :percentage

      t.references :product, foreign_key: true
      t.references :vendor, foreign_key: true
    end
  end
end
