require 'rails_helper'

 describe Review do
  it { should validate_presence_of :description }
  it { should validate_presence_of :user_rating }
  it { should belong_to :food }

  it("ensures the length of description is at least 50 characters") do
    @food = Food.new
    @review = @food.reviews.new({:description => "a".*(49)})
    expect(@review.save()).to(eq(false))
  end

  it("ensures the length of description is not over 250 characters") do
    @food = Food.new
    @review = @food.reviews.new({:description => "a".*(251)})
    expect(@review.save()).to(eq(false))
  end


end
