Rails.application.routes.draw do


  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :areas do
    member do
      get 'brands', to: 'areas#brands', as: 'area_brands'
    end
  end

  resources :brands do

  end

  resources :categories do
    resources :category_i18ns
  end

  resources :items do
    resources :item_i18ns
    resources :item_values
  end

  resources :collections
  resources :properties




  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/ctrl_panel'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
end
