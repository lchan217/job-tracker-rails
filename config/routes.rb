Rails.application.routes.draw do
  resources :jobs
  resources :sources
  root 'sources#index'
end