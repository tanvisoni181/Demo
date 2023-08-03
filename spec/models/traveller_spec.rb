require 'rails_helper'

RSpec.describe Traveller, type: :model do
  describe "association" do 
    it "should has many bookings" do 
      traveller = Traveller.reflect_on_association(:bookings)
      expect(traveller.macro).to eq(:has_many)
      expect(traveller.options[:dependent]).to eq(:destroy)
    end

    it "should has many tours through bookings" do 
      traveller = Traveller.reflect_on_association(:tours)
      expect(traveller.macro).to eq(:has_many)
      expect(traveller.options[:through]).to eq(:bookings)
    end
  end

end
