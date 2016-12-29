Rails.application.routes.draw do
  root 'dashboards#index'

  resources :positions
  resources :carts
  resources :orders
  resources :users
  resources :comments
  resources :items
  resources :dashboards, only: [:index]
end
