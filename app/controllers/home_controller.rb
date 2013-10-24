class HomeController < ApplicationController
  #skip_before_action :require_login, only: [:login, :register]
  before_action :require_login, except: [:login, :register]

  layout 'mobile'

  def register
    user = User.find_or_initialize_by(name: params[:UserCode].upcase)

    if user.save
      session[:user] = user.id 
    end

    redirect_to root_url
  end

  def logout
    session[:user] = nil
    redirect_to :login
  end
end
