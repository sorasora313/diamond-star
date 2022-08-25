Rails.application.routes.draw do
  devise_for :users
 
  root to: "nights#index"
  resources :users, only: [:show]
  resources :nights do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
end
