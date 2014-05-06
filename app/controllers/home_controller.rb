class HomeController < ApplicationController
  before_action :require_login

  def index
    @activity = Activity.last
  end  
end
