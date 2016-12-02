Rails.application.routes.draw do
  root 'users#new'

  resource :user, only: [:new, :create]
end
