Rails.application.routes.draw do
  resources :clearance_batches, only: [:index, :show, :create]
  root to: "clearance_batches#index"
  resources :items
end
