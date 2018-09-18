require 'rails_helper'

include Warden::Test::Helpers

describe "the add a food item process" do

  it "try to route to new food page and redirect to sign in page" do
    visit new_food_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  it "reach new food page" do
    @user = User.create( email: "example@gmail.com", password: "eeeeee")
    login_as(@user, :scope => :user)
    visit new_food_path
    binding.pry
    expect(page).to have_content 'New list'
  end

end