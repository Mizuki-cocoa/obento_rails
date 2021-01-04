Rails.application.routes.draw do
  root "top#index"
  resources :dishes, only: [:index, :show]
  resources :sub_dishes, only: [:index, :show]
  resources :bentos, only: [:index]
  resources :carts, only: [:index]
  resources :customers, only: [:index, :show, :new] do
    resources :orders, only: [:index]
  end
  resources :boxes, only: [:index] do
    resources :bentos, only: [:index]
  end
  resources :orders

  namespace :admin do
    resources :customers, only: [:index, :show]
    resources :dishes do
      get "stocks",on: :collection
    end
    resources :sub_dishes
    root "top#index"
  end

  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update, :create]
  resource :password, only: [:show, :edit, :update]
end
