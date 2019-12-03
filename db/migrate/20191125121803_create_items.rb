class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :images
      t.integer :price
      t.string :ship_way
      t.string :ship_price
      t.string :ship_date
      t.string :condition
      t.timestamps
    end
  end
end
