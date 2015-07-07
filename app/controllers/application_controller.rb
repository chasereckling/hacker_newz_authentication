class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_admin
    if current_user
      if current_user.admin === true
        @user_admin = current_user
      end
    end
  end

  helper_method :current_user
  helper_method :user_admin
end
