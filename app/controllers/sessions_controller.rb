class SessionsController < ApplicationController

#before_filter :authenticate_user, :only => [:home, :profile, :setting]
#before_filter :save_login_state, :only => [:login, :login_attempt]

  def new
  end

  def create
  end

  def login
    #login form
  end

  def logout
  session[:user_id] = nil
  redirect_to :method => 'login'
  end
  
  def login_attempt
    user = User.find_by(:username => params[:login_username], :password => params[:login_password] )
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome again, you logged in as #{user.username}"
      redirect_to root_path
    else
      flash[:notice] = "Invalid username or password - why is this message showing up everywhere?"
      render "login"	
    end
    #render :text => @user.inspect

  end

end