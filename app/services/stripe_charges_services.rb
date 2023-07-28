class StripChargesServices
	
	DEFAULT_CURRENCY = 'inr'.freeze

	def initialize(params, user)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @order = params[:booking_id]
    @user = user
  end

  def call
    create_charge(find_traveller)
  end

  private

  attr_accessor :traveller, :stripe_email, :stripe_token, :booking

  def find_traveller
   if user.stripe_token
    retrieve_traveller(user.stripe_token)
   else
    # create_traveller
   end
  end

  def retrieve_traveller(stripe_token)
    Stripe::Traveller.retrieve(stripe_token) 
  end

  def create_traveller
    traveller = Stripe::Traveller.create(
      email: stripe_email,
      source: stripe_token
    )
    user.update(stripe_token: traveller.id)
    traveller 
  end

  def create_charge(traveller)
    Stripe::Charge.create(
      traveller: traveller.id,
      amount: tour_amount,
      description: traveller.email,
      currency: DEFAULT_CURRENCY
    )
  end

  def tour_amount
    tour.find_by(id: tour.id).amount
  end

end