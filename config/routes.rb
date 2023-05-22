require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/admin/sidekiq'
  root "events#index"
  resources :users, only: [:new, :create]
  get "users/login", to: "users#login"
  post "users/login", to: "users#authentication"
  get "users/logout", to: "users#logout"
  resources :events do
    get "participant", on: :member
  end
end
