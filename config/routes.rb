require "sidekiq/web"
Rails.application.routes.draw do
  root "restaurants#index"
  namespace :admin do
    mount Sidekiq::Web => "/sidekiq"
  end
  resources :restaurants, only: [ :index, :show ]
  resources :devices, only: [ :show ]
  namespace :api do
    namespace :v1 do
      resources :devices
    end
  end
end
