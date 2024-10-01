module Admin
  class UsersController < Admin::ApplicationController
    def resource_params
      if action_name == "create"
        create_params
      else
        update_params
      end
    end

    private

    # Parameters for user creation
    def create_params
      permitted_params = [ :email, :first_name, :last_name, :display_name, :phone_number, :password, :password_confirmation ]
      permitted_params << :admin if current_user.admin? # Only allow admin to set the admin flag
      params.require(:user).permit(permitted_params)
    end

    # Parameters for user updates
    def update_params
      permitted_params = [ :email, :first_name, :last_name, :display_name, :phone_number ]
      permitted_params << :password << :password_confirmation if password_present?
      permitted_params << :admin if current_user.admin? # Only allow admin to update the admin flag
      params.require(:user).permit(permitted_params)
    end

    # Helper method to check if password fields are present during update
    def password_present?
      params[:user][:password].present? || params[:user][:password_confirmation].present?
    end
  end
end
