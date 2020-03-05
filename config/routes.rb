Rails.application.routes.draw do
  
  resource :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/homepage', to: 'users#homepage'
  post '/logout', to: 'sessions#destroy'
  # is the post /logout even necessary? 


end
