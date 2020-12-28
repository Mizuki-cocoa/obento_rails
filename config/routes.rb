Rails.application.routes.draw do
  resources :dishes
  resources :sub_dishes
  resources :customers
end
