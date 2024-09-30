Rails.application.routes.draw do
  # Admin namespace
  namespace :admin do
    resources :users
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
  resources :blog_posts, only: [:index, :show]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA dynamic routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Default root route for all users
  root to: "home#index" # This will handle both authenticated and unauthenticated cases

  # Unauthenticated root route
  unauthenticated do
    root "home#index", as: :unauthenticated_root
  end

  # Authenticated root route
  authenticated :user do
    root "home#index", as: :authenticated_root
  end
end
