class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false, index: true
      t.text :image, null: false
      t.integer :price, null: false
      t.integer :ship_way, null: false
      t.integer :ship_price, null: false
      t.integer :ship_date, null: false
      t.integer :condition, null: false
      t.integer :buyer
      t.integer :saler, null: false
      t.text :description, null: false
      t.integer :prefecture_id, null: false
      t.timestamps
    end
  end
end
