class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :buyer, :integer
    add_column :items, :saler, :integer
    add_column :items, :description, :text
    add_column :items, :ship_place, :integer
  end
end
