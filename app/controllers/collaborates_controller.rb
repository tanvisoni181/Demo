class CollaboratesController < ApplicationController

  def index
    # organizer_id = current_user.organizer.id 
    # @organizer = Organizer.find(organizer_id)
     @hotel = Hotel.find(params[:hotel_id])
     @collaborates = @hotel.collaborates.all
  end

  def new
    organizer_id = current_user.organizer.id 
    @organizer = Organizer.find(organizer_id)
    @tour = @organizer.tours.find(params[:tour_id])
    @hotel = Hotel.find(params[:hotel_id])
    
    @collaborate = @tour.collaborates.new(hotel_id:@hotel.id)
  end

  def create
     organizer_id = current_user.organizer.id 
    @organizer = Organizer.find(organizer_id)
    @tour = @organizer.tours.find(params[:tour_id])
    @hotel = Hotel.find(params[:hotel_id])
     
    @collaborate = @tour.collaborates.new(set_params.merge(hotel_id:@hotel.id))

    if @collaborate.save
      
      flash[:notice] = "Booking has been confirmed successfully."
      redirect_to organizer_tour_hotel_collaborate_path(id: @collaborate.id)
    else
      render :new 
    end
  end

  def show
    
     organizer_id = current_user.organizer.id 
     @organizer = Organizer.find(organizer_id)
     @tour = @organizer.tours.find_by(params[:tour_id])

     @hotel = Hotel.find(params[:hotel_id])
     @collaborate = @hotel.collaborates.find(params[:id])
  end

  private
  def set_params
    params.require(:collaborate).permit(:no_of_rooms, :room_type,:date, :hotel_id, :tour_id)
  end
  
end
