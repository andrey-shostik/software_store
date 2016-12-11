Rails.application.routes.draw do
  root 'users#new'

  resource :user, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end
