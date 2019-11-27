class Item < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
  mount_uploader :image, ImageUploader
  validates :name, presence: true
end
