class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :store_location
  before_action :require_login

  def current_user
    session[:user] if session[:user]
  end

  def user_name
    User.find(current_user).name
  rescue
    nil
  end
  helper_method :user_name

  def current_user_instance
    User.find(current_user)
  rescue
    nil
  end
  helper_method :current_user_instance

  def store_location
    if request.get? && request.fullpath !~ /\/login/ && request.fullpath !~ /feedbacks\/\d+/
      session[:previous_url] = request.fullpath
    end
  end

  def redirect_back_or(url, *args)
    url = session.delete(:previous_url) || url
    redirect_to url, *args
  end

  private

  def logged_in?
    !!user_name
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end
