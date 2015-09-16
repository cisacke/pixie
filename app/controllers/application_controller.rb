class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_users
    return nil unless session[:session_token]
    @current_users ||= User.find_by(session_token: session[:session_token])
  end

  def sign_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def sign_out!
    current_users.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def is_signed_in?
    !!current_users
  end

  def require_not_signed_in

  end

  def require_signed_in!
    redirect_to new_session_url unless is_signed_in?
  end
end
