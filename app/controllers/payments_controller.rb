# frozen_string_literal: true

class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
    @traveller = Traveller.find(current_user.id)
    @booking = @traveller.bookings.find_by(id: params[:booking_id])
  end

  def create
    @traveller = Traveller.find(current_user.id)
    @booking = @traveller.bookings.find(params[:id])

    # source = params[:stripeToken]
    params[:stripeTokenType]
    amount = @booking.tour.amount * @booking.no_of_travellers

    customer = Stripe::Customer.create({
                                         name: current_user.name,
                                         email: current_user.email,
                                         description: "Customer id: #{current_user.id}"
                                         # source: params[:stripeToken]
                                       })

    card = Stripe::PaymentMethod.create({
                                          type: 'card',
                                          card: {
                                            token: params[:stripeToken]
                                          }
                                        })

    payment_intent = Stripe::PaymentIntent.create({
                                                    customer: customer.id,
                                                    amount: amount,
                                                    description: 'Description of booking',
                                                    currency: 'INR',
                                                    # automatic_payment_methods: {enabled: true},
                                                    payment_method: card.id,
                                                    capture_method: 'automatic',
                                                    confirm: true,
                                                    payment_method_options: {
                                                      card: {
                                                        request_three_d_secure: 'automatic' # Request 3D Secure authentication for all transactions
                                                      }
                                                    }

                                                  })

    session[:payment_intent_id] = payment_intent.id

    # render json: { client_secret: payment_intent.client_secret }

    Stripe::PaymentIntent.confirm(
      payment_intent.id,
      { payment_method: card.id }
    )
    # auth = Stripe::PaymentIntent.increment_authorization(
    #   payment = payment_intent.id,
    #   {amount: amount}
    #   )
    redirect_to traveller_booking_payment_path(@traveller, @booking, payment_intent.id)

    # @booking.update(
    #  payment_status: 'paid',
    #  total_amount: amount,
    #  payment_date: Time.now,
    #  stripe_charge_id: payment_intent.id
    #   )
    # redirect_to payments_path

    # rescue Stripe::CardError => e
    # flash[:error] = e.message
    # redirect_to new_payment_path
  end

  def require_action; end

  def get_payment_intent_status
    # Assuming you have the PaymentIntent ID stored somewhere, e.g., in session
    payment_intent_id = session[:payment_intent_id]

    # Retrieve the PaymentIntent from Stripe
    payment_intent = Stripe::PaymentIntent.retrieve(payment_intent_id)

    # Respond with JSON containing the PaymentIntent status and next_action
    render json: { status: payment_intent.status, next_action: payment_intent.next_action }
  end

  def show; end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :booking_id, :stripeTokenType, :payment_intent_id)
  end
end
