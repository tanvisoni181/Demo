require 'rails_helper'

RSpec.describe "Organizers", type: :request do

  describe "GET /show organizer" do
     context 'when user is authenticated' do
      before do
        byebug # Assuming you have a User model and FactoryBot set up.
        @organizer = create(:organizer) 
        sign_in @organizer      # Assuming you have an Organizer model and FactoryBot set up.
        get organizer_path(@organizer)
      end

      it "assigns organizer" do 
       get organizer_path(@organizer)
       expect(assigns(:organizer)).to eq(@organizer)
      end

      it "renders the :show template" do
       expect(response).to render_template(:show)
      end

    # it "returns 404 status if organizer not found" do
    #    organizer = FactoryBot.create(:organizer)
    #   organizer_id = organizer.id + 2

    #   get organizer_path(organizer_id)
    #   expect{response.errors.messages}.to raise_error(ActiveRecord::RecordNotFound)
    # end
    end
  end
end
