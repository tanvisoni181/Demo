class HotelsController < ApplicationController

	def index 
	end

	def new
		@hotel = Hotel.new
	end

	def create
		@hotel = Hotel.new(set_params)
		if @hotel.save
			redirect_to hotel_path(@hotel)
		else
			render new
		end
	end

	def show
		@hotel = Hotel.find(params[:id])
	end

	def edit
		@hotel = Hotel.find(params[:id])
	end

	def update
		@hotel = Hotel.find(params[:id])
		if @hotel.update(set_params)
			redirect_to hotel_path(@hotel)
		else
			render :edit 
		end
	end
	

	private
	def set_params
		params.require(:hotel).permit(:hotel_name, :city)
	end
end
