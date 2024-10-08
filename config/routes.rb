Rails.application.routes.draw do
  # Static pages route
  get "about", to: "static#about"

  # Admin namespace
  namespace :admin do
    resources :users
    resources :blog_posts
    root to: "users#index"
  end

  # Devise routes
  devise_for :users, controllers: { sessions: "devise/sessions" }

  devise_scope :user do
    get "signup", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
    delete "logout", to: "devise/sessions#destroy" # Custom logout route
  end

  # BlogPost routes
  resources :blog_posts, only: [ :index, :show, :new, :create ]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA dynamic routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root route for all users (authenticated and unauthenticated)
  root "home#index"
end
