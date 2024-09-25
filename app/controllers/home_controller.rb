class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # Ensure Devise mapping is correctly set
    @request.env["devise.mapping"] = Devise.mappings[:user]
    # Your logic here
  end
end