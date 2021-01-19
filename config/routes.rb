Rails.application.routes.draw do
  root "top#index"
  resources :dishes, only: [:index, :show] do
    get "search", on: :collection
  end
  resources :sub_dishes, only: [:index, :show, :create]
  resources :bentos
  resources :carts
  resources :associations
  resources :customers, only: [:index, :show, :new]
  resources :orders, only: [:index, :show, :new, :create] do
    get "confirm"
  end
  resources :boxes, only: [:index] do
    resources :bentos, only: [:index]
  end
  resources :orders

  namespace :admin do
    resources :customers
    resources :dishes do
      get "stocks",on: :collection
    end
    resources :sub_dishes do
      get "stocks",on: :collection
    end
    root "top#index"
  end

  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update, :create]
  resource :password, only: [:show, :edit, :update]
end
