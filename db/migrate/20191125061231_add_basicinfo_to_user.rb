class AddBasicinfoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string,null: false
    add_column :users, :last_name, :string,null: false
    add_column :users, :first_name, :string,null: false
    add_column :users, :last_kana, :string ,null: false
    add_column :users, :first_kana, :string ,null: false
    add_column :users, :year_id, :integer,null: false
    add_column :users, :month_id, :integer,null: false
    add_column :users, :date_id, :integer,null: false
    add_column :users, :tell_no, :string,null: false
    add_column :users, :self_info, :text
    add_column :users, :image, :string
    add_column :users, :uid, :string
    add_column :users, :provider ,:string
    add_column :users, :meta, :string
    add_column :users, :token, :string
  end
end
