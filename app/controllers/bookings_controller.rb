class BookingsController < ApplicationController
  
   before_action :set_id, only: %i[ new  show  ]
   before_action :find_traveller, only: %i[ index create ]

   def index 
    @bookings = @traveller.bookings
   end

  def new
    @booking = @traveller.bookings.new(tour_id:@tour.id)
  end

  def create
    @booking = @traveller.bookings.new(set_params)


      if @booking.save
        UserMailer.with(traveller:@traveller,booking:@booking).booking_confirmation_mailer.deliver
        redirect_to traveller_booking_path(@traveller,@booking)
      else
        render :new 
      end
  end

  def show
    @booking = @traveller.bookings.find(params[:id])
  end


  private

  def set_params
    params.require(:booking).permit(:no_of_travellers, :tour_id,
      :traveller_id,:traveller_name,:email,:total_amount,:payment_date,:stripe_charge_id, :payment_status)
  end

  def set_id
    @traveller = Traveller.find(current_user.id)
    @tour = Tour.find_by(id: params[:tour_id])
  end

  def find_traveller
    @traveller = Traveller.find(current_user.id)
  end

end
