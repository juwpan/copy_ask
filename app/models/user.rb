class User < ApplicationRecord
  include Gravtastic
  extend FriendlyId
    
  has_many :questions, dependent: :delete_all

  has_secure_password

  friendly_id :nickname
  gravtastic(secure: true, filetype: :png, size: 100, default: 'robohash')

  before_validation :downcase

  validates :color,
  format: { with: /\A#\h{3}{1,2}\z/ }

  validates :email, presence: true, uniqueness: true,
  format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  
  validates :nickname, presence: true, uniqueness: true,
  format: { with: /\A[a-zA-Z0-9_]{1,40}\z/ }

  private 

  def should_generate_new_friendly_id?
    nickname_changed?
  end

  def downcase
    nickname&.downcase!
    email&.downcase!
  end
end