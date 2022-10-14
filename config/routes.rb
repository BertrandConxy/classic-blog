Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root "users#index"
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
    end
  end
end
