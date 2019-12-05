class Item < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
  has_one :category
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :image, presence: { message: "画像がありません" }
  validates :description, length: { in: 1..1000}, presence: true
  validates :ship_way, :ship_price, :ship_date, :condition, :ship_place, presence: { message: "選択してください" }
  validates :price ,presence: {message: "300以上9999999以下で入力してください"}, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}

end
