module Admin
  class UsersController < Admin::ApplicationController
    # Override `resource_params` to permit custom attributes.
    def resource_params
      permitted_params = params.require(:user).permit(
        :email, 
        :password, 
        :password_confirmation, 
        :first_name, 
        :last_name, 
        :display_name, 
        :phone_number
      )

      # Only allow admins to update the `admin` attribute
      if current_user.admin?
        permitted_params[:admin] = params[:user][:admin]
      end

      permitted_params
    end

    # Optionally, you can also override other actions like update, create, etc., if necessary.

    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a user is updated.
    #
    # def update
    #   super
    #   send_user_updated_email(requested_resource)
    # end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.where(admin: false)
    #   end
    # end
  end
end
