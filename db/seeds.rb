# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

@user = User.create( email: "example@gmail.com", password: "eeeeee")
50.times do |i|
  @food = @user.foods.build(:name => Faker::Food.fruits, :price => 1+rand(4), :location=> Faker::Address.country)
  @food.save!
  @random_number = 1+rand(4)
  @random_number.times do
    @review = @food.reviews.new(:description => Faker::BojackHorseman.quote, :user_rating => 1+rand(4))
    @review.save!
  end
end