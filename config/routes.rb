# frozen_string_literal: true

Rails.application.routes.draw do
  get 'partner/:id/hotel/:id/register', to: 'hotels#register', as: 'register'
  get 'partner/:id/info', to: 'hotels#info', as: 'info'
  get 'organizer/:id/tours/:id', to: 'tours#destroy', as: 'destroy_tour'
  get 'partner/:id/info/:id', to: 'hotels#destroy', as: 'destroy_hotel'
  get 'bookings/:id/payments/new', to: 'payments#new', as: 'new_payment'
  post 'bookings/:id/payments/create', to: 'payments#create', as: 'create_payment'
  # get 'booking/:id/payments/require_action', to: 'payments#require_action', as: 'secure'
  # get 'payments/status', to: 'payments#get_payment_intent_status', as: 'status'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :partners do
    resources :hotels
  end

  resources :organizers do
    resources :tours do
      resources :hotels, only: [:index] do
        resources :collaborates, only: %i[new create show]
      end
    end
  end

  resources :travellers do
    resources :bookings do
      resources :payments, only: %i[show]
    end
  end

  resources :messages

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'homes#index'
end
