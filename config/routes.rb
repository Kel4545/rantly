Rails.application.routes.draw do
  root "rants#index"
  get "signin" => "sessinons#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  resources :registrations, only: [:new, :create]
  end