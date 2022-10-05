Rails.application.routes.draw do
  resources :posts
  root "users#index"
  devise_for :users
  resources :users, only: [:index, :show]
end
