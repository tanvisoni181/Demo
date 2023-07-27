class BookingsController < ApplicationController
   before_action :set_id, only: %i[ new create show  ]


  def new
    @booking = @traveller.bookings.new(tour_id:@tour.id)
  end

  def create
  
    @booking = @traveller.bookings.new(set_params.merge(tour_id:@tour.id))


    respond_to do |format|
      if @booking.save
        format.html {redirect_to traveller_booking_path(@traveller,@booking),flash: {notice: "Booking is confirmed!!!"}}
      else
        format.html {render action: "new"}
      end
    end
  end

  def show
    @booking = @traveller.bookings.find(params[:id])
  end

  def charge
    
     # @traveller = Traveller.find(current_user.id)
     # @booking = @traveller.bookings.find(params[:id])
     # @amount = @booking.tour.amount

     # # Create the charge using Stripe API
     # # charge = Stripe::Charge.create(
     # #  booking: @booking.id
     # #  amount: @amount, 
     # #  currency: 'inr',
     # #  # source: params[:stripe_token] 
     # #  )

     # @booking.update(
     #  payment_status: 'paid',
     #  total_amount: @amount,
     #  payment_date: Time.now,
     #  # stripe_charge_id: charge.id 
     #  )

     # redirect_to information_path , notice:'Booking and Payment were successfull.'
     # resue Stripe::CardError => e 
     # flash[:error] = e.message
     # redirect_to @booking
  end

  def information
  end

  private

  def set_params
    params.require(:booking).permit(:no_of_travellers, :tour_id,
      :traveller_id,:traveller_name,:email,:total_amount,:payment_date,:stripe_charge_id, :payment_status)
  end

  def set_id
    @traveller = Traveller.find(current_user.id)
    @tour = Tour.find_by(params[:tour_id])
  end
end
