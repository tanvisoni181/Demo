class CollaboratesController < ApplicationController

  before_action :set_id, only: %i[ new create show ]

  def index
     @hotel = Hotel.find(params[:hotel_id])
     @collaborates = @hotel.collaborates.all
  end

  def new
    @tour = @organizer.tours.find(params[:tour_id])
    @hotel = Hotel.find(params[:hotel_id])
    
    @collaborate = @tour.collaborates.new(hotel_id:@hotel.id)
  end

  def create
    @tour = @organizer.tours.find(params[:tour_id])
    @hotel = Hotel.find(params[:hotel_id])
     
    @collaborate = @tour.collaborates.new(set_params.merge(hotel_id:@hotel.id))
     respond_to do |format|
      if @collaborate.save
      format.html { redirect_to organizer_tour_hotel_collaborate_path(id: @collaborate.id),
                    flash: {notice: "Booking has been confirmed successfully."} }
    else
      format.html {render action: "new" }
    end
   end
  end

  def show
     @tour = @organizer.tours.find_by(params[:tour_id])

     @hotel = Hotel.find(params[:hotel_id])
     @collaborate = @hotel.collaborates.find(params[:id])
  end

  private
  def set_params
    params.require(:collaborate).permit(:no_of_rooms, :room_type,:check_in, :check_out)
  end

  def set_id
    organizer_id = current_user.id 
    @organizer = Organizer.find(organizer_id)
  end
  
end
