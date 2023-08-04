# frozen_string_literal: true

class CollaboratesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_organizer, only: %i[new create show]
  before_action :find_tour, only: %i[new create show]
  before_action :find_hotel, only: %i[index new create show]

  def index
    @collaborates = @hotel.collaborates
  end

  def new
    @collaborate = @tour.collaborates.new(hotel_id: @hotel.id)
  end

  def create
    @collaborate = @tour.collaborates.new(set_params.merge(hotel_id: @hotel.id))
    if @collaborate.save
      UserMailer.with(partner: @hotel.partner, organizer: @tour.organizer).collaboration_confirmation.deliver
      redirect_to organizer_tour_hotel_collaborate_path(id: @collaborate.id)
    else
      render :new
    end
  end

  def show
    @collaborate = @hotel.collaborates.find(params[:id])
  end

  private

  def set_params
    params.require(:collaborate).permit(:no_of_rooms, :room_type, :check_in, :check_out)
  end

  def find_organizer
    @organizer = Organizer.find(current_user.id)
  end

  def find_tour
    @tour = @organizer.tours.find(params[:tour_id])
  end

  def find_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end
end
