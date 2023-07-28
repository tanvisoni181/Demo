Rails.application.routes.draw do
 
    get 'hotel/:id/register', to: 'hotels#register', as: 'register'
    get 'partner/:id/info', to: 'hotels#info', as: 'info'
    
   
  
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
   resources :payments do 
    post 'create', on: :member
    get  'show', on: :collection
   end
  resources :travellers do 
    resources :bookings
  end
 
   
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "homes#index"
end
