class Review < ActiveRecord::Base
  validates :user_rating, :presence => true
  validates(:description, {:presence => true, :length => {:maximum => 250, :minimum => 50}})

  
  belongs_to :food

  scope :five_most_recent, -> { order(created_at: :desc).limit(5)}


end
