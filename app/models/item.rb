class Item < ApplicationRecord
  belongs_to :users
  belongs_to :category
  belongs_to :bland
end
