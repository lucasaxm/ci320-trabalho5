class SessionsController < ApplicationController
  def new
    if session[:user_id] != nil
      redirect_to trainers_path, :notice => "You are already logged in!"
    end
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to trainers_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid login or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
