Rails.application.routes.draw do
  resources :users, only: [:new, :index, :create]
  resources :sessions, only: [:new, :destroy, :create]
end
