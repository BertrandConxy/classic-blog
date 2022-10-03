Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  devise_for :users
  root "users#index"
end
