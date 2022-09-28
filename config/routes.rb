Rails.application.routes.draw do
  root to: 'pages#home'
  get "/home", to: "pages#home", as: "home"
  get "/about", to: "pages#about", as: "about"
  get "bookings/confirmation", to: "bookings#confirmation", as: "confirmation"
  patch "bookings/confirmation", to: "bookings#update", as: "update_bookings"


  

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get "/bookings/new/search", to: "bookings#search", as: "search"
  
  resources :bookings, shallow: true, only: [:new, :index, :show, :create, :destroy]

  resources :demons, shallow: true, only: [:new, :show, :create, :index, :destroy]
end
