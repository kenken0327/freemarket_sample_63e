class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.integer :prefecture_id,null: false
      t.string :post_no,null: false
      t.string :city,null: false
      t.string  :town,null: false
      t.string :building
      t.integer :tell
      t.timestamps

    end
  end
end
