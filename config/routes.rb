Rails.application.routes.draw do
  devise_for :users

  resources :sectors, only: [:index]
  resources :reports, only: [:index] do
    collection do
      get 'full_report', to: 'reports#full_report'
    end

  end

  get 'errors/in_construction', to: 'errors#in_construction'

  root "sectors#index"

  get '*path' => redirect('errors/in_construction')
end
