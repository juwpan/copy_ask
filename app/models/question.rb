class Question < ApplicationRecord 
  belongs_to :user
  belongs_to :author, class_name: "User", foreign_key: :author_id
  
  has_many :hashtag_appearances
  has_many :hashtags, through: :hashtag_appearances
  
  validates :body, presence: true, length: { maximum: 280 }
end
