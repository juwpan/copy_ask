class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: "User", foreign_key: :author_id
  
  has_many :hashtag_appearances, dependent: :delete_all
  has_many :hashtags, through: :hashtag_appearances, dependent: :delete_all

  before_create :hashtag_all
  
  validates :body, presence: true, length: { maximum: 280 }

  def hashtag_all
    hashtags = self.body.scan(/#[[:word:]-]+/).map { |tag| Hashtag.find_or_create_by!(name: tag) }

    self.hashtags << hashtags
  end
end
