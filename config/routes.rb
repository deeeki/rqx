Rails.application.routes.draw do
  root 'requests#index'
  resources :requests, only: [:show, :create]
end
