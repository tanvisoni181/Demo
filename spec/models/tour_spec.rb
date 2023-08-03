require 'rails_helper'

RSpec.describe Tour, type: :model do
  describe "association" do 

    it "should belongs to organizer" do 
      association = described_class.reflect_on_association(:organizer)
      expect(association.macro).to eq(:belongs_to)
      expect(association.options[:polymorphic]).to be true
    end

    it "should has many collaborates" do
      association = described_class.reflect_on_association(:collaborates)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy) 
    end

    it "should has many hotels through collaborates" do 
      association = described_class.reflect_on_association(:hotels)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:collaborates)
    end

    it "should has many images" do 
       tour = Tour.new(destination_name: 'delhi', pickup_and_dropping_point: 'mumbai', pickup_date:Date.today, dropping_date: Date.today, amount: 5000, inclusions: 'All meals', organizer_id:1, organizer_type: 'User')
       # expect(tour).has_many_attached(:images)
    end

    it "should has many bookings" do 
      association = described_class.reflect_on_association(:bookings)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end

    it "should has many travellers through bookings" do 
      association = described_class.reflect_on_association(:travellers)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:bookings)
    end
  end

  describe "validations" do 

    it 'validates presence of destination name' do
     tour = Tour.new
     tour.valid?
     expect(tour.errors[:destination_name]).to include("can't be blank")
    end  
    
    it 'validates presence of pickup_and_dropping_point' do
     tour = Tour.new
     tour.valid?
     expect(tour.errors[:pickup_and_dropping_point]).to include("can't be blank")
    end 
    
    it 'validates presence of amount' do
     tour = Tour.new
     tour.valid?
     expect(tour.errors[:amount]).to include("can't be blank")
    end 

    it 'validates presence of inclusions' do
     tour = Tour.new
     tour.valid?
     expect(tour.errors[:inclusions]).to include("can't be blank")
    end 

    it 'validates presence of pickup date' do
     tour = Tour.new
     tour.valid?
     expect(tour.errors[:pickup_date]).to include("can't be blank")
    end 

    it 'validates presence of dropping date' do
     tour = Tour.new
     tour.valid?
     expect(tour.errors[:dropping_date]).to include("can't be blank")
    end 
  end

  describe "methods" do 
    it "custom validation pickup and dropping date should be validate" do
      tour = Tour.new
      if tour[:pickup_date].present? && tour[:pickup_date] < Date.today
        expect(tour.errors[:pickup_date]).to include("can't be past date")
      end
      if tour[:dropping_date].present? && tour[:dropping_date] < Date.today
        expect(tour.errors[:dropping_date]).to include("can't be past date")
      end
    end
  end
end
