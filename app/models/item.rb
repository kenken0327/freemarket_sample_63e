class Item < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
  mount_uploader :images, ImageUploader
  validates :name, presence: true
end
