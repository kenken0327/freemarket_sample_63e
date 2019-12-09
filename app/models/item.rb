class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :prefecture
  belongs_to :category
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  enum condition:[:新品、未使用, :"未使用に近い", :"目立った傷や汚れなし", :"やや傷や汚れあり", :"傷や汚れあり", :"全体的に状態が悪い"]
  enum ship_price:[:"送料込み(出品者負担)", :"着払い(購入者負担)"]
  enum ship_way:[:"未定", :"らくらくメルカリ便", :"ゆうメール", :"レターパック", :"普通郵便(定形、定形外)", :"クロネコヤマト", :"ゆうパック", :"クリックポスト", :"ゆうパッケット"]
  enum ship_date:[:"1~2日で発送", :"2~3日で発送", :"4~7日で発送"]
  
  validates :name, presence: true
  validates :image, presence: { message: "画像がありません" }
  validates :description, length: { in: 1..1000}, presence: true
  validates :ship_place, :category_id, :ship_way, :ship_price, :ship_date, :condition, presence: { message: "選択してください" }
  validates :price ,presence: {message: "300以上9999999以下で入力してください"}, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}
end
