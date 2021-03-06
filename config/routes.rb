Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'users#index'
  resources :users, only: [:new, :create, :show]
  resources :ideas

  namespace :admin do
    resources :categories
    resources :images
  end
end
