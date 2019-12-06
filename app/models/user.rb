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
  validates :last_name, presence: true, format: {with: /\A[一-龥]+\z/}
  validates :first_name, presence: true, format: {with: /\A[一-龥]+\z/}
  validates :last_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :first_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :year_id, presence: true
  validates :month_id, presence: true
  validates :date_id, presence: true
  validates :tell_no, presence: true, format: {with: /\A\d{3}[-]\d{4}[-]\d{4}\z/}


end
