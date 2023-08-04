ActiveAdmin.register Collaborate do
  actions :all, except: [:new, :edit,:update, :destroy]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :tour_id, :hotel_id, :room_type, :no_of_rooms, :check_in, :check_out
  #
  # or
  #
  # permit_params do
  #   permitted = [:tour_id, :hotel_id, :room_type, :no_of_rooms, :check_in, :check_out]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
