Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :ideas

  root :to => 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '*unmatched_route', to: 'application#not_found'
end
