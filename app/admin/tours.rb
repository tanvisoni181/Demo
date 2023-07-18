ActiveAdmin.register Tour do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :destination_name, :pickup_and_dropping_point, :pickup_date, :dropping_date, :inclusions, :images, :amount, :tourable_type, :tourable_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:destination_name, :pickup_and_dropping_point, :pickup_date, :dropping_date, :inclusions, :images, :amount, :tourable_type, :tourable_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
