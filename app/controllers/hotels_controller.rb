class HotelsController < ApplicationController
     before_action :set_partner, only: [ :new, :create,:show, :update, :register, :destroy, :info, :edit]
     before_action :find_hotel_id, only: %i[ show update register destroy ]

	def index 
		@hotels = Hotel.all
	end

	def new
		@hotel = @partner.hotels.build
	end

	def create
		@hotel = @partner.hotels.build(set_params)
		if @hotel.save
			redirect_to partner_hotel_path(@partner,@hotel), notice: "Hotel Registered Successfully."
		else
			render :new
		end
	end

	def show
	end

	def edit
		@hotel = @partner.hotels.find(params[:id])
	end

	def update
		if @hotel.update(set_params)
			redirect_to partner_hotel_path(@hotel)
		else
			render :edit 
		end
	end

	def register
	end

	def destroy
		@hotel.destroy 

		redirect_to info_path

	end

	def info
		@hotels = @partner.hotels
	end

	private

	def find_hotel_id
		@hotel = @partner.hotels.find(params[:id])
	end
	def set_partner
		@partner = Partner.find(current_user.id)
	end
	def set_params
		params.require(:hotel).permit(:hotel_name, :city)
	end
end
