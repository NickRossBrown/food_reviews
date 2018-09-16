class Review < ActiveRecord::Base
  validates :description, :presence => true
  # validates :user_rating, :presence => true
  belongs_to :food

  scope :five_most_recent, -> { order(created_at: :desc).limit(5)}

  
end
