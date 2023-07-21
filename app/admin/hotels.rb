ActiveAdmin.register Hotel do
  remove_filter :tours

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
   # actions :index, :edit, :create, :update, :destroy
   permit_params :hotel_name, :city
  #
  # or
  #
  # permit_params do
  #   permitted = [:hotel_name, :city]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
