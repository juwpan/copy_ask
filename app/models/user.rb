class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :color,
    format: { with: /\A#\h{3}{1,2}\z/ }

  validates :email, presence: true, uniqueness: true,
    format: { with: /\A[^@\s]+@[^@\s]+\z/ }
    
  validates :nickname, presence: true, uniqueness: true,
    format: { with: /\A[a-zA-Z0-9_]{1,40}\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
