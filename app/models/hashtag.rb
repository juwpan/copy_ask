class Hashtag < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :hashtag_appearances
  has_many :questions, through: :hashtag_appearances, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
end
