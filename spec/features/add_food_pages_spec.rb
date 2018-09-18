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
    expect(page).to have_content 'New list'
  end

  it "add a new food item" do
    @user = User.create( email: "example@gmail.com", password: "eeeeee")
    login_as(@user, :scope => :user)
    visit new_food_path
    fill_in 'Name', :with => 'AWESOME APPLE'
    select('$$', :from => "food_price")
    select('USA', :from => "food_location")
    click_button('Create Food')
    click_on 'Create Food'
    expect(page).to have_content 'AWESOME APPLE'
  end

end