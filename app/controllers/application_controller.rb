class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

def authenticate_user
  if session[:user_id]
     # set current user object to @current_user object variable
    @current_user = User.find session[:user_id] 
    return true	
  else
    redirect_to login_path #(:controller => 'sessions', :method => 'login')
    return false
  end
end
def save_login_state
  if session[:user_id]
    redirect_to(:controller => 'sessions', :method => 'home')
    return false
  else
    return true
  end
end