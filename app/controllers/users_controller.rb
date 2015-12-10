class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
    @user = User.new(get_user_params)
    if @user.save
      session[:user_id] = @user.id
      render :text => 'success'
    else
      redirect_to root_path
    end
  end

  private

  def get_user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
