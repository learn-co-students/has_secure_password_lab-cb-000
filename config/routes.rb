Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  resources :users, :only => [:new, :create]
  get '/index' => 'users#index'
end
