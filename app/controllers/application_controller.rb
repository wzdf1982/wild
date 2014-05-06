class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :store_location

  def current_user
    session[:user] if session[:user]
  end

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
    !!current_user
  end

  def require_login
    unless logged_in?
      user = User.new_guest
      if user.save
        session[:user] = user.id
      end
    end
  end
end
