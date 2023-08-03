require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "associations" do 
    it "should belongs to tour" do 
      association = described_class.reflect_on_association(:tour)
      expect(association.macro).to eq(:belongs_to)
    end  

    it "should belongs to traveller" do 
      association = described_class.reflect_on_association(:traveller)
      expect(association.macro).to eq(:belongs_to)
      expect(association.options[:polymorphic]).to be true
    end
  end

  describe "validations" do 
    it "should presence of traveller name" do 
      booking = Booking.new
      booking.valid?
      expect(booking.errors[:traveller_name]).to include("can't be blank")
    end

    it "should presence of traveller email" do 
      booking = Booking.new
      booking.valid?
      expect(booking.errors[:email]).to include("can't be blank")
    end 

    it "should presence of traveller id " do 
      booking = Booking.new
      booking.valid?
      expect(booking.errors[:traveller_id]).to include("can't be blank")
    end

    it "should presence of tour id" do 
      booking = Booking.new
      booking.valid?
      expect(booking.errors[:tour_id]).to include("can't be blank")
    end

    it "should presence of traveller name" do 
      booking = Booking.new
      booking.valid?
      expect(booking.errors[:traveller_name]).to include("can't be blank")
    end

    it "should presence of no_of_traveller greater than 0" do 
      booking = Booking.new(no_of_travellers:-1)
      expect(booking.valid?).to be false 
    end
  end

end
