class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :sign_in?

  def current_user
    return unless session[:user_id]
    User.find(session[:user_id])
  end

  def sign_in?
    current_user
  end



end
