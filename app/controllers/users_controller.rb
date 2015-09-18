class UsersController < ApplicationController

  def index

  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      #write test for failed attempt
    end
  end

  def show
  end
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end