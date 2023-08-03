require 'rails_helper'

RSpec.describe Organizer, type: :model do
  describe "association" do 
    it "has many tours" do
     organizer = Organizer.reflect_on_association(:tours)
     expect(organizer.macro).to eq(:has_many)
     expect(organizer.options[:dependent]).to eq(:destroy)
    end

  end
end
