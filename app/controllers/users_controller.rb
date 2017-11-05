class UsersController < ApplicationController

before_filter :save_login_state, :only => [:new, :create]

  def new
    @user = User.new 
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to login_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"

  end


  private
    def user_params
      params.require(:user).permit(:username, :email, :last_name, :first_name, :password)
    end
  
end
