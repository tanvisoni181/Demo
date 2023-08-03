require 'rails_helper'

RSpec.describe Collaborate, type: :model do

  describe "association" do 
    it "should belongs to hotel" do 
      association = described_class.reflect_on_association(:hotel)
      expect(association.macro).to be(:belongs_to)
    end

    it "should belongs to tour" do 
      association = described_class.reflect_on_association(:tour)
      expect(association.macro).to be(:belongs_to)
    end
  end

  describe "validations" do 
    it "should presence of no of rooms" do 
      collaborate = Collaborate.new
      collaborate.valid?
      expect(collaborate.errors[:no_of_rooms]).to include("can't be blank")
    end

    it "should presence of room type" do 
      collaborate = Collaborate.new
      collaborate.valid?
      expect(collaborate.errors[:room_type]).to include("can't be blank")
    end

    it "should presence of check in date" do 
      collaborate = Collaborate.new
      collaborate.valid?
      expect(collaborate.errors[:check_in]).to include("can't be blank")
    end

    it "should presence of check out date" do 
      collaborate = Collaborate.new
      collaborate.valid?
      expect(collaborate.errors[:check_out]).to include("can't be blank")
    end
  end

  describe "methods" do 
    it "custom validation check in and check out  date should be validate" do
      collaborate = Collaborate.new
      if collaborate[:check_in].present? && collaborate[:check_in] < Date.today
        expect(collaborate.errors[:check_in]).to include("can't be past date")
      end
      if collaborate[:check_out].present? && collaborate[:check_out] < Date.today
        expect(collaborate.errors[:check_out]).to include("can't be past date")
      end
    end
  end
end
