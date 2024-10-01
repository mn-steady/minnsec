module Admin
  class UsersController < Admin::ApplicationController
    def resource_params
      if action_name == "create"
        # Require all fields when creating a new user
        params.require(:user).permit(
          :email,
          :first_name,
          :last_name,
          :display_name,
          :phone_number,
          :admin,
          :password,
          :password_confirmation
        )
      else
        # Allow updates without requiring any fields
        permitted_params = params.require(:user).permit(
          :email,
          :first_name,
          :last_name,
          :display_name,
          :phone_number,
          :admin
        )

        # Conditionally allow password updates only if provided
        if params[:user][:password].present? || params[:user][:password_confirmation].present?
          permitted_params.merge!(params.require(:user).permit(:password, :password_confirmation))
        end

        permitted_params
      end
    end
  end
end
