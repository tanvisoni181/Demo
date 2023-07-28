class ChargesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create
    @traveller = Traveller.find(current_user.id)
  	@booking = Booking.find(params[:id])
    booking_id = @booking.id
    
    source = params[:source]
    traveller_id = @traveller.id

    charge = Stripe::Charge.create({
      :booking => booking_id,
      :traveller => traveller_id,
      :amount => @booking.tour.amount,
      :description => 'Description of booking',
      :currency => 'inr',
      :source => source 
    })

    rescue Stripe::CardError => e 
    flash[:error] = e.message 
    redirect_to new_charge_path
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :booking_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end

end
