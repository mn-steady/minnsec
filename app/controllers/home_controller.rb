class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    # Debug output to inspect the request environment and devise mappings
    # Rails.logger.debug "Devise mapping: #{request.env['devise.mapping']}"
    # Rails.logger.debug "Current user: #{current_user.inspect}"
  end
end
