class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user  
    
  private  
  def current_user
    if (session[:user_id] != nil) && (User.where(:id => session[:user_id]).empty?)
      reset_session
    end
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_login
    if (session[:user_id] != nil) && (User.where(:id => session[:user_id]).empty?)
      reset_session
    end
  	if session[:user_id] == nil
  		redirect_to log_in_path, :notice => "Only users can view this page."
  	elsif session[:user_id] == 1
      @adm = true
    else
      @adm = false
    end
  end

  def notshow
    redirect_to root_url
  end
end
