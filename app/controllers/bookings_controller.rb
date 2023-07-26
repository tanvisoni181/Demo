class BookingsController < ApplicationController
  def new
    @traveller = Traveller.find(current_user.id)
    @tour = Tour.find(params[:tour_id])
    @booking = @traveller.bookings.new(tour_id:@tour.id)
  end
  def create
    byebug
    @traveller = Traveller.find(current_user.id)
    @tour = Tour.find_by(params[:tour_id])
    @booking = @traveller.bookings.new(set_params.merge(tour_id:@tour.id))

    respond_to do |format|
      if @booking.save
        format.html {redirect_to traveller_booking_path(id:@booking.id), flash: {notice: "Booking is confirmed!!!"}}
      else
        format.html {render action: "new"}
      end
    end
  end

  def show
    @traveller = Traveller.find(current_user.id)
    @tour = Tour.find_by(params[:tour_id])
    @booking = @traveller.bookings.find(params[:id])
  end

  private

  def set_params
    params.require(:booking).permit(:traveller_count, :amount,:tour_id,:traveller_id,:traveller_name,:email)
  end
end
