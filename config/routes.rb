Rails.application.routes.draw do
  root "events#index"

  devise_for :users

  resources :events
  resources :users, only: %i[show edit update]
end
