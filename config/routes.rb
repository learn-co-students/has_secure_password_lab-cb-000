Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'users#welcome'
end
