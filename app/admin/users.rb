# frozen_string_literal: true

ActiveAdmin.register User do
  actions :all, except: [:new, :edit,:update]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  permit_params :email, :encrypted_password, :type, :name, :phone_no, :address
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :type, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :name, :phone_no, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
