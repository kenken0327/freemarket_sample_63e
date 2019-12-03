class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false, index: true
      t.text :image
      t.integer :price
      t.string :ship_way
      t.string :ship_price
      t.string :ship_date
      t.string :condition
      t.integer :saler, null: false
      t.integer :buyer
      t.timestamps
    end
  end
end
