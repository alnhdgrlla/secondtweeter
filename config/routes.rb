Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tweets#index"

  resources :users, only: [:index, :show, :edit, :update, :create]
  resources :tweets, only: [:index, :create, :destroy]
  resources :relationships, only: [:index, :create, :destroy]

  resources :users do
    member do
      get :followees, :followers
    end
  end
end
