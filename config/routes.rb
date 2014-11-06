Rails.application.routes.draw do


  root "root#show"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  get "/rants/:rant_id/spam" => "rants#spam", as: :spam
  get "/rants/:rant_id/unspam" => "rants#unspam", as: :unspam
  get "/disable/:id" => "admins#disable", as: :disable
  get "/enable/:id" => "admins#enable", as: :enable
  get "/account_confirmation", to: "users#account_confirmation"
  get "/admins/rants", to: "admins#rants"
  get "/admins/users", to: "admins#users"
  get "/admins/spam", to: "admins#spam"
  get "/admin/impersonate/:user_id" => "admins#impersonate", as: :impersonate
  get "/admin/neinimpersonate" => "admins#neinimpersonate", as: :neinimpersonate


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
  resource :admins, only: [:show]

end
