Rails.application.routes.draw do
  get 'buy/index'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :buy, only: [:index, :create]
end

# get "login" => "sessions#new"
