Rails.application.routes.draw do
  root "top#index"
  resources :dishes
  resources :sub_dishes
  resources :customers do
    resources :orders, only: [:index]
  end
  resources :boxes
  resources :orders

  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
end
