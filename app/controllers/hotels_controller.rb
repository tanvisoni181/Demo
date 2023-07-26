class HotelsController < ApplicationController
     before_action :set_partner, only: [ :new, :create, :destroy, :info]

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
		@hotel = Hotel.find(params[:id])
	end

	def edit
		@partner = Partner.find(current_user.id)
		@hotel = @partner.hotels.find(params[:id])
	end

	def update
		@hotel = Hotel.find(params[:id])
		if @hotel.update(set_params)
			redirect_to partner_hotel_path(@hotel)
		else
			render :edit 
		end
	end

	def register
		@hotel = Hotel.find(params[:id])
	end

	def destroy
		@hotel = @partner.hotels.find(params[:id])
		@hotel.destroy 

		redirect_to info_path

	end

	def info
		@hotels = @partner.hotels.all
	end

	private

	def set_partner
		@partner = Partner.find(current_user.id)
	end
	def set_params
		params.require(:hotel).permit(:hotel_name, :city)
	end
end
