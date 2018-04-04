Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :home, only: :index
  resources :accounts
  resources :posts do
    member do
      post :toggle_hidden
    end
  end
  resources :login_logs, only: :index
  resources :statistics, only: :index
end
