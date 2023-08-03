require 'rails_helper'

RSpec.describe Partner, type: :model do
  describe "association" do 
    it "has many hotels" do
     partner = Partner.reflect_on_association(:hotels)
     expect(partner.macro).to eq(:has_many)
     expect(partner.options[:dependent]).to eq(:destroy)
    end
  end
end
