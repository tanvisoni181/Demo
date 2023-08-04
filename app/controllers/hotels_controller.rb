# frozen_string_literal: true

class HotelsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_partner, except: [:index]
  before_action :find_hotel, only: %i[show update register destroy edit]
  

  def index
    @hotels = Hotel.order(created_at: :desc).page(params[:page]).per(3)
    respond_to(&:html)
  end

  def new
    @hotel = @partner.hotels.build
  end

  def create
    @hotel = @partner.hotels.build(set_params)

    if @hotel.save
      redirect_to partner_hotel_path(@partner, @hotel),
                  notice: "Congratulations!!! #{@hotel.hotel_name} is Registered Successfully."
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @hotel.update(set_params)
      redirect_to partner_hotel_path(@hotel), notice: "Hotel #{@hotel.hotel_name} Updated Successfully."
    else
      render :edit
    end
  end

  def register; end

  def destroy
    @hotel.destroy

    redirect_to info_path
  end

  def info
    @hotels = @partner.hotels
  end

  private

  def find_hotel
    @hotel = @partner.hotels.find(params[:id])
  end

  def find_partner
    @partner = Partner.find(current_user.id)
  end

  def set_params
    params.require(:hotel).permit(:hotel_name, :city)
  end
end
