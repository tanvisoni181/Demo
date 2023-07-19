Rails.application.routes.draw do
  get 'collaborates/index'

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  
  resources :organizers do 
    resources :tours
  end
  resources :hotels, :travellers, :collaborates
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "homes#index"
end
