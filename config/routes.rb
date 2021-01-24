Rails.application.routes.draw do
  root "top#index"
  resource :account, except: [:index] do
    get "order"
  end
  resource :admin_session, only: [:create, :destroy]

  resources :associations
  resources :bentos
  resources :boxes, only: [:index]
  resources :carts, only: [:index, :create]
  resources :customers, only: [:index, :show, :new, :create]
  resources :dishes, only: [:index, :show] do
    get "search", on: :collection
  end
  resources :orders, only: [:new, :create] do
    get "confirm"
  end

  resource :password, only: [:show, :edit, :update]
  resource :session, only: [:create, :destroy]
  resources :sub_dishes, only: [:index, :show, :create]


  namespace :admin do
    resources :boxes
    resources :customers
    resources :dishes do
      get "stocks",on: :collection
    end
    resources :login, only: [:index]
    resources :orders, only: [:index]
    resources :sub_dishes do
      get "stocks",on: :collection
    end
    root "top#index"
  end

  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"
end
