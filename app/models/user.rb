class User < ApplicationRecord
  has_secure_password

  extend FriendlyId
  friendly_id :nickname, use: :slugged

  before_save :downcase

  has_many :questions, dependent: :delete_all


  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'robohash')
  
  validates :color,
    format: { with: /\A#\h{3}{1,2}\z/ }

  validates :email, presence: true, uniqueness: true,
    format: { with: /\A[^@\s]+@[^@\s]+\z/ }
    
  validates :nickname, presence: true, uniqueness: true,
    format: { with: /\A[a-zA-Z0-9_]{1,40}\z/ }

  def downcase
    nickname.downcase!
    email.downcase!
  end
end
