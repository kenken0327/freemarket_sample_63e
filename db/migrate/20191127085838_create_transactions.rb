class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.string :buy, default: "出品中"
      t.timestamps
    end
  end
end
