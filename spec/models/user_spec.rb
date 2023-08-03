# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model testing" do 
    it "validates user instance" do 
      user = User.new(name:'Tanvi', email:'tanvi@gmail.com', phone_no:'1234567890', address: 'indore', password: 'user1234', type: 'Organizer')

      expect(user).to be_valid
    end
  end

  it "invalidate user object without attributes" do
  user = User.new(name: 'Tanvi')

  expect(user).to_not be_valid 
  end

  it "invalidate user with short password" do 
     user = User.new(name:'Tanvi', email:'tanvi@gmail.com', phone_no:'1234567890', address: 'indore', password: 'user', type: 'Organizer')

     expect(user).to_not be_valid
  end

  it "invalidate user object with incorrect email" do 
    user = User.new(name:'Tanvi', email:'invalid_email', phone_no:'1234567890', address: 'indore', password: 'user', type: 'Organizer')

    expect(user).to_not be_valid
  end

  it "invalidate user object with short phone_no" do 
    user = User.new(name:'Tanvi', email:'invalid_email', phone_no:'1234', address: 'indore', password: 'user', type: 'Organizer')

    expect(user).to_not be_valid
  end

  it "defines the correct type values for the 'type' attribute" do
    expect(User.types).to eq([ "Organizer", "Partner", "Traveller"])
  end
end
