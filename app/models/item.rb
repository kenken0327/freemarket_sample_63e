class Item < ApplicationRecord
  belongs_to :users
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true

end
