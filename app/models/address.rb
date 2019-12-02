class Address < ApplicationRecord

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :user
belongs_to_active_hash :prefecture

validates :prefecture_id, presence: true
validates :post_no, presence: true,format: {with: /\A\d{3}[-]\d{4}\z/}
validates :city, presence: true
validates :town, presence: true

end
