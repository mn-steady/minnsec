class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Add the custom fields to the permitted parameters for Devise.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :display_name, :phone_number ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :display_name, :phone_number ])
  end

  # Redirect to the login page after sign out
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirects to login page after logout
  end
end
