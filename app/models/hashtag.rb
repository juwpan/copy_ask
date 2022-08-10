class Hashtag < ApplicationRecord
  has_many :hashtag_appearances
  has_many :questions, through: :hashtag_appearances

  validates :name,
  format: { with: /#[[:word:]-]+/ }
end
