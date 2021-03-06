class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def user_signed_in?
    session[:logged_in]
  end

  def require_login
    unless user_signed_in?
      redirect_to login_path
    end
  end

  helper_method :require_login
  helper_method :user_signed_in?
end
