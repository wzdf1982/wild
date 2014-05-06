class HomeController < ApplicationController

  def index
    @activity = Activity.last
  end  
end
