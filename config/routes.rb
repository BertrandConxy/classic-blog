Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  root "users#index"
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts
  end
end
