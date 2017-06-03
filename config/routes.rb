Rails.application.routes.draw do
  devise_for :users

  resources :sectors, only: [:index]
  resources :reports, only: [:index]
  root "home#dashboard"
end
