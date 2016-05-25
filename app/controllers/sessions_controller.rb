class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      flash[:message] = "Log in was successful"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    flash[:message] = "Logged out successfully"
    redirect_to root_path
  end

end