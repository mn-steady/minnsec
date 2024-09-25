Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA dynamic routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Devise-specific routes for login, signup, logout
  devise_scope :user do
    get "signup", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
    delete "logout", to: "devise/sessions#destroy"
  end

  # Authenticated users root route
  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  # Unauthenticated users root route
  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
