class CollaboratesController < ApplicationController
  def index
    organizer_id = current_user.organizer.id 
    @organizer = Organizer.find(organizer_id)
    # @hotel = Hotel.find(params[:hotel_id])
    @collaborates = @organizer.collaborates.all
  end

  def new
    organizer_id = current_user.organizer.id 
    @organizer = Organizer.find(organizer_id)
    @hotel = Hotel.find(params[:hotel_id])
    @collaborate = @organizer.collaborates.new(hotel_id:@hotel.id)
  end

  def create
    organizer_id = current_user.organizer.id 
    @organizer = Organizer.find(organizer_id)
    @hotel = Hotel.find(params[:hotel_id])
     

    @collaborate = @organizer.collaborates.new(set_params.merge(hotel_id: @hotel.id))
    if @collaborate.save
      redirect_to hotel_collaborate_path(id: @collaborate.id)
    else
      render :new 
    end
  end

  def show
    organizer_id = current_user.organizer.id 
    @organizer = Organizer.find(organizer_id)
    @hotel = Hotel.find(params[:hotel_id])
    @collaborate = @organizer.collaborates.find(params[:id])
  end

  private
  def set_params
    params.require(:collaborate).permit(:no_of_rooms, :room_type, :hotel_id, :organizer_id)
  end
  
end
