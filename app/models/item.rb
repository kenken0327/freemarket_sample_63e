class Item < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true

end
