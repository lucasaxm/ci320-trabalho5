class UsersController < ApplicationController
  def new
    if session[:user_id] != nil
      redirect_to trainers_path, :notice => "You are already logged in!"
    end
    @user = User.new
  end  
    
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end
