Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles
  resources :users, only: [:show, :edit, :update]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end
