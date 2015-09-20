class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{current_user.username}!"
      redirect_to ideas_path
    else
      flash.now[:errors] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
