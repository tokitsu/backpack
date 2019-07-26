Rails.application.routes.draw do
  get 'login', to: 'users#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'search', to: 'boards#search'
  get 'mypage', to: 'users#mypage'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  resources :sessions
  namespace :admin do
    resources :users
  end

  resources :boards do
    post 'add', to: 'favorites#create'
    delete 'add', to: 'favorites#destroy'
  end
  resources :comments, only: %i[create destroy]
  resources :favorites, only: %i[index]
  resources :questions
  resources :answers, only: %i[create destroy]
  resources :homes
  resources :conversations do
    resources :messages
  end
  resources :users
end
