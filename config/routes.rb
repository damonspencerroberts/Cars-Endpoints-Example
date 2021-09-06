Rails.application.routes.draw do
  resources :owners do
    resources :cars
  end
end
