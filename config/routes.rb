Rails.application.routes.draw do
  root "top#index"
  resources :dishes
  resources :sub_dishes
  resources :customers

  resource :session, only: [:create, :destroy]
end
