Rails.application.routes.draw do
  root to: "home#index"

  devise_for :models

  resources :home, only: :index
end