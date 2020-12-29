Rails.application.routes.draw do
  root "top#index"
  resources :dishes
  resources :sub_dishes
  resources :customers
  resources :boxes

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
end
