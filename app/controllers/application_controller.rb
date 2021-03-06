class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def logged_in?
    !current_user.nil?
  end

  def current_user
    return nil if session[:session_token].nil?

    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout_user!
    current_user.reset_session_token!

    session[:session_token] = nil
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def require_login
    redirect_to session_url unless logged_in?
  end
end
