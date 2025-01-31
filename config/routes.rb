Rails.application.routes.draw do

  root to: "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  resources :users do 
    resources :payments, only: [:index, :new, :create]
  end

  resources :pays, only: [:new, :create]

  resources :subscriptions, only: [:new, :create]

  delete '/subscriptions', to: 'subscriptions#destroy'

  resources :categories, only: [:index]

  resources :articles, only: [:index]
  resources :sources, only: [:index]



  post '/webhooks', to: 'webhooks#create'


  namespace :api do 
    namespace :v1 do 
      resources :registrations, only: [:index, :create]
      post 'login', to: "sessions#login"
      post 'logout',to:  "sessions#logout"
    end
  end
end
