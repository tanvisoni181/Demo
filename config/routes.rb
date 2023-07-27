Rails.application.routes.draw do
 
    
    # get 'information/:id', to:'collaborates#information', as: 'information'
    get 'hotel/:id/register', to: 'hotels#register', as: 'register'
    get 'partner/:id/info', to: 'hotels#info', as: 'info'
    # get 'travellers/:id/bookings/:id/information', to: 'bookings#information', as: 'information'

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :partners do 
    resources :hotels
  end 
  
  resources :organizers do 
    resources :tours do 
      resources :hotels, only: [:index] do 
        resources :collaborates, only: [:new, :create, :show]
      end
    end
  end
  resources :travellers do 
    resources :bookings do 
      post 'charge', on: :member
      # get 'charge', on: :collection
    end
  end
  # resources :hotels, only: [:new, :create, :show, :edit, :update]
   
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "homes#index"
end
