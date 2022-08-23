Rails.application.routes.draw do
  devise_for :users
  root to: "nights#index"
  resources :nights, only: [:index, :new, :create, :show, :edit, :update]
end
