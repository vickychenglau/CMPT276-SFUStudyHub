class SessionsController < ApplicationController

#before_filter :authenticate_user, :only => [:home, :profile, :setting]
#before_filter :save_login_state, :only => [:login, :login_attempt]

  def new
  end

  def create
  end

  def login

  end

  def logout
$apiflag = 0
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

  def login_attempt

    user = User.find_by(:username => params[:login_username], :password => params[:login_password] )
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in"
      redirect_to root_path
    else
      flash[:notice] = "Invalid username or password"
      render "login"
    end
    #render :text => @user.inspect

  end

end
