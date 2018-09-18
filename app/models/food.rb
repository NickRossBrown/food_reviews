class Food < ActiveRecord::Base
  validates :name, :presence => true
  validates :price, :presence => true
  validates :location, :presence => true
  has_many :reviews
  belongs_to :user
  has_one_attached :image

  scope(:featured_foods, -> do
    where({:featured => true})
  end)

  scope(:made_in_USA, -> do
    where({:location => "United States"})
  end)

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
    select("foods.id, foods.name, foods.location, foods.price, foods.description, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("foods.id")
    .order("reviews_count DESC")
    .limit(10)
    )}

    
end
