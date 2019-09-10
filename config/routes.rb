Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :new, :show]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :items, only: [:new, :show]
  resources :ownerships, only: [:create, :destroy]
  
  get 'rankings/want', to: 'rankings#want'
  get 'rankings/have', to: 'rankings#have'
end
