Rails.application.routes.draw do

  root "root#show"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  get "/rants/:rant_id/spam" => "rants#spam", as: :spam
  get "/users/set_complete", :to => "users#set_complete"



  resources :users do
    resources :follows
    resources :favorites, only: [:index]
    resources :rants do
      resources :favorites, only: [:create, :destroy]
      resources :comments
    end
  end
  resources :dashboard, only: [:show]
  resources :search
end
