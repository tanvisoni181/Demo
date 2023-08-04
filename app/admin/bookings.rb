ActiveAdmin.register Booking do

  actions :all, except: [:new, :edit,:update, :destroy]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :tour_id, :no_of_travellers, :traveller_type, :traveller_id, :traveller_name, :email, :payment_status, :stripe_charge_id, :payment_date, :total_amount
  #
  # or
  #
  # permit_params do
  #   permitted = [:tour_id, :no_of_travellers, :traveller_type, :traveller_id, :traveller_name, :email, :payment_status, :stripe_charge_id, :payment_date, :total_amount]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
