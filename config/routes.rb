Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :places, only: [ :show, :index ] do
    resources :matches, only: [ :create]
  end

  get "users/:id/matches", to: "matches#user_matches", as: :user_matches

  get "load", to: "pages#load", as: :load

  get "search", to: "pages#search"
  #  get "places/:id/matches", to: "matches#destroy"



  resources :matches, only: [:index, :destroy]

end
