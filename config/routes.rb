Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:create, :new, :index, :show, :destroy] do
    resources :comments, only: [:new, :create]
  end
end
