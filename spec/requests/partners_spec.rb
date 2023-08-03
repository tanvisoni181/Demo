require 'rails_helper'

RSpec.describe "Partners", type: :request do
  describe "Get/show" do 
    it "should show partner from user" do 
      partner_params = Partner.build(:partner)
      partner = Partner.create(partner_params)

      get :show, id: partner.id

      response.should redirect_to(partner)
    end
  end
end
