Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :places, only: [ :show, :index ] do
    resources :matches, only: [ :create]
  end

  get "users/:id/matches", to: "matches#user_matches"
  #  get "places/:id/matches", to: "matches#destroy"



  resources :matches, only: [:index, :destroy]
  # root to: 'pages#index'

end
