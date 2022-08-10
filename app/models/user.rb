require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  extend FriendlyId
  include Gravtastic
  
  gravtastic
  
  before_create :confirm_token do
    self.confirm_token = SecureRandom.uuid if self.confirm_token.blank? 
  end
  
  before_validation :downcase
  
  has_many :questions, dependent: :delete_all
  
  friendly_id :nickname, use: :slugged

  validates :color,
    format: { with: /\A#\h{3}{1,2}\z/ }

  validates :email, presence: true, uniqueness: true,
    format: { with: /\A[^@\s]+@[^@\s]+\z/ }
    
  validates :nickname, presence: true, uniqueness: true,
    format: { with: /\A[a-zA-Z0-9_]{1,40}\z/ }


  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    
    save!(validate: false)
  end

  private
  
  def downcase
    nickname.downcase!
    email.downcase!
  end
end
