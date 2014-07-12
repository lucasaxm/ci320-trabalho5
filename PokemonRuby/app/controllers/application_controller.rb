class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user  
    
  private  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_login
  	if session[:user_id] == nil
  		redirect_to log_in_path, :notice => "Only users can view this page."
  	end
  end
end
