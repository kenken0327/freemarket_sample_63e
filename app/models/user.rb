class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :address

  
  belongs_to_active_hash :year
  belongs_to_active_hash :month
  belongs_to_active_hash :day

  accepts_nested_attributes_for :address


  
end
