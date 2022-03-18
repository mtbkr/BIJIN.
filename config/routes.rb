Rails.application.routes.draw do
  get 'user_sessions/new'
  resources :users, only: [:create]

  get 'signup', to: 'users#new'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sseisons#destroy'

  root 'top#index'
end
