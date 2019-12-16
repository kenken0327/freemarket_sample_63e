class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,:trackable

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
  
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create( nickname: auth.info.name,
                          provider: auth.provider,
                          uid:      auth.uid,
                          token:    auth.credentials.token,
                          password: Devise.friendly_token[0, 20],
                          meta:     auth.to_yaml)
    end
  end
end
