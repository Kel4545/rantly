Rails.application.routes.draw do
  root "rants#index"
  get "signin" => "sessinons#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  get "register" => "register#register", as: :register
  end