class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # Your logic here
  end
  
end
