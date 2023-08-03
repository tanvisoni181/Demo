require 'rails_helper'

RSpec.describe "Travellers", type: :request do
  describe "GET /travellers" do
    it "works! (now write some real specs)" do
      get travellers_path
      expect(response).to have_http_status(200)
    end
  end
end
