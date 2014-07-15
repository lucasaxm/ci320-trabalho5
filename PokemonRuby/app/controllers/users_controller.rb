class UsersController < ApplicationController

  def index
    @users = User.all
  end

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

  def destroy
    @bag=Bag.find(params[:id])
    @bag.destroy
    if @adm
      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Only the admin can destroy things." }
        format.json { head :no_content }
      end
    end
  end

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end
