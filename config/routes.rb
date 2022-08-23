Rails.application.routes.draw do
  devise_for :users
  root to: "nights#index"
  resources :users, only: [:show]
  resources :nights do
    resources :comments, only: [:create]
  end
end
