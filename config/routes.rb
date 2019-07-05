Rails.application.routes.draw do
  get 'login', to: 'users#'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'search', to: 'boards#search'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'boards#index'
  resources :sessions
  resources :users
  resources :boards do
    post 'add', to: 'favorites#create'
    delete 'add', to: 'favorites#destroy'
  end
  resources :comments, only: %i[create destroy]
  resources :favorites, only: %i[index]
  resources :questions
  resources :answers, only: %i[create destroy]
end
