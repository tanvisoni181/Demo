class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create
    @traveller = Traveller.find(current_user.id)
  	@booking = Booking.find(params[:id])
    
    # source = params[:stripeToken]
    card_detail = params[:stripeTokenType]
    amount = @booking.tour.amount * @booking.no_of_travellers
    
    customer = Stripe::Customer.create({
      name: current_user.name,
      email: current_user.email,
      description: "Customer id: #{current_user.id}",
      source: params[:stripeToken]
    })

    card = Stripe::PaymentMethod.create({
      type: 'card',
      card: card_detail
    })
   
    @payment = Stripe::PaymentIntent.create({
      customer: customer.id,
      amount: amount,
      description: 'Description of booking',
      currency: 'usd', 
      automatic_payment_methods: {enabled: true},
      payment_method: card.id

    })
    
    
    @booking.update(
      payment_status: 'paid',
      total_amount: amount,
      payment_date: Time.now,
      stripe_charge_id: @payment.id 
       )
    redirect_to payments_path(@payment)

    rescue Stripe::CardError => e 
    flash[:error] = e.message 
    redirect_to new_payment_path
  end
  
  def show
    
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :booking_id, :stripeTokenType)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end

end
