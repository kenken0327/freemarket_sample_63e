class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :address
  has_many :items
  has_many :cards
  belongs_to_active_hash :year
  belongs_to_active_hash :month
  belongs_to_active_hash :day

  validates :nickname, presence: true, uniqueness: true
  validates :last_name,:first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_kana,:first_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :year_id,:month_id,:date_id,presence: {message:"選択して下さい"}
  validates :tell_no, presence: true, format: {with: /\A\d{3}[-]\d{4}[-]\d{4}\z/}
end
