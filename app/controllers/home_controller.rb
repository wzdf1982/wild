class HomeController < ApplicationController
  #skip_before_action :require_login, only: [:login, :register]
  before_action :require_login, except: [:login, :register]

  layout 'mobile'
  caches_page :login
  
  def index
  end

  def login
  end

  def register
    if !User.where(name: params['UserCode'].upcase).empty? || User.new(name: params['UserCode'].upcase).save
      session[:user] = User.where(name: params['UserCode'].upcase).first.id
    end

    redirect_to root_url
  end

  def logout
    session[:user] = nil
    redirect_to :login
  end
end
