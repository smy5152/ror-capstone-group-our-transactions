Rails.application.routes.draw do
  root 'users#home'
  get 'log', to: 'sessions#login'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :groups, only: %i[show destroy new create index update edit]
  resources :tasks, only: %i[show destroy new create index update edit]
  resources :users, only: %i[show update destroy home edit new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
