Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'articles#index'
  resources :articles
  resources :users, only: [:show, :edit, :update]
  # ↓チュートリアル
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
end
