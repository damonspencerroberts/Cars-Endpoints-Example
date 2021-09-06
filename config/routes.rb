require 'sidekiq/web'

Rails.application.routes.draw do
  resources :owners, only: [:index, :show, :create, :update, :destroy]
  resources :cars, only: [:index, :show, :create, :update, :destroy]
  get '/cars-by-owner', to: 'cars#index_by_owner'
  mount Sidekiq::Web => '/sidekiq'
end
