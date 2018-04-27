Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :places, only: [ :show, :index ] do
    resources :matches, only: [ :create]
  end

  get "users/:id/matches", to: "matches#user_matches"
  #  get "places/:id/matches", to: "matches#destroy"



  resources :matches, only: [:index, :destroy]
  # root to: 'pages#index'
end
