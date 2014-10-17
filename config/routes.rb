Rails.application.routes.draw do
  root "root#show"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout




  resources :users do
    resources :search
    resources :follows
    resources :favorites, only: [:index]
    resources :rants do
      resources :favorites, only: [:create, :destroy]
      resources :comments
    end
  end
  resources :dashboard, only: [:show]
end
