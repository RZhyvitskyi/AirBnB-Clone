Rails.application.routes.draw do
  get 'demons/index'
  get 'demons/show'
  get 'demons/new'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  root to: 'pages#home'
  get "/home", to: "pages#home", as: "home"
  get "/about", to: "pages#about", as: "about"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :bookings, shallow: true, only: [:new, :index, :show, :create, :destroy] do
  end

end
