ActiveAdmin.register Organizer do
   remove_filter :tours
   actions :all , :except => [:new,:create, :edit]



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :address, :phone_no, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :address, :phone_no, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
