class SessionsController < ApplicationController
  def new

  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]

    user = User.find_by_email(email)

    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to users_path
    else
      redirect_to login_path
    end
  end
end
