require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe "association" do
   it "should be belongs_to partner polymophically" do 
     association = described_class.reflect_on_association(:partner)
     expect(association.macro).to eq(:belongs_to)
     expect(association.options[:polymorphic]).to be true
   end 

   it "should has many collaborates" do 
    association = described_class.reflect_on_association(:collaborates)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:dependent]).to eq(:destroy)
   end

   it "should has many tours through collaborates" do 
    association = described_class.reflect_on_association(:tours)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:through]).to eq(:collaborates)
   end
  
  describe "validations" do 
    it "should be validate hotel_name" do 
      hotel = Hotel.new
      hotel.valid?
      expect(hotel.errors[:hotel_name]).to include("can't be blank")
    end

    it "should be validate city" do 
      hotel = Hotel.new
      hotel.valid?
      expect(hotel.errors[:city]).to include("can't be blank")
    end

  end

  end
end
