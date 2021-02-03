Rails.application.routes.draw do
  resources :sources, only: [:index] do
    resources :jobs, only: [:index]
  end

  resources :jobs, only: [:new, :create]

  root 'sources#index'
end