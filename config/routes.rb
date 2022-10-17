Rails.application.routes.draw do
  root "users#index"
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
end
