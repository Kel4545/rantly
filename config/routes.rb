Rails.application.routes.draw do
  root "root#show"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout


  resources :users do
    resources :rants
    resources :follows
  end

  resources :dashboard
  end